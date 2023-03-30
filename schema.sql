
CREATE TABLE public.users (
    id text NOT NULL,
    name text,
    email text,
    email_verified timestamp(3) without time zone,
    image text,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (id)
) WITH (
    seaplane_table_type=global
    );

CREATE TABLE public."Post" (
    id text NOT NULL,
    title text NOT NULL,
    content text,
    published boolean DEFAULT false NOT NULL,
    "authorId" text,
    CONSTRAINT "Post_pkey" PRIMARY KEY (id),
    CONSTRAINT Post_authorId_fkey
      FOREIGN KEY("authorId") 
	  REFERENCES users(id)
) WITH (
    seaplane_table_type=global
    );


CREATE TABLE public.accounts (
    id text NOT NULL,
    user_id text NOT NULL,
    type text NOT NULL,
    provider text NOT NULL,
    provider_account_id text NOT NULL,
    refresh_token text,
    access_token text,
    expires_at integer,
    token_type text,
    scope text,
    id_token text,
    session_state text,
    oauth_token_secret text,
    oauth_token text,
    CONSTRAINT accounts_pkey PRIMARY KEY (id),
    "accounts_user_id_fkey" text,
    CONSTRAINT Post_authorId_fkey
      FOREIGN KEY("accounts_user_id_fkey") 
	  REFERENCES users(id)
) WITH (
    seaplane_table_type=global
    );


CREATE TABLE public.sessions (
    id text NOT NULL,
    session_token text NOT NULL,
    user_id text NOT NULL,
    expires timestamp(3) without time zone NOT NULL,
    CONSTRAINT sessions_pkey PRIMARY KEY (id),
    "sessions_user_id_fkey" text,
    CONSTRAINT Post_authorId_fkey
      FOREIGN KEY("sessions_user_id_fkey") 
	  REFERENCES users(id)
) WITH (
    seaplane_table_type=global
    );


CREATE TABLE public.verificationtokens (
    identifier text NOT NULL,
    token text NOT NULL,
    expires timestamp(3) without time zone NOT NULL,
    PRIMARY KEY(identifier)
) WITH (
    seaplane_table_type=global
    );


-- ALTER TABLE ONLY public."Post"
--     ADD CONSTRAINT "Post_pkey" PRIMARY KEY (id);


-- ALTER TABLE ONLY public.accounts
--     ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


-- ALTER TABLE ONLY public.sessions
--     ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


-- ALTER TABLE ONLY public.users
--     ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- CREATE UNIQUE INDEX accounts_provider_provider_account_id_key ON public.accounts USING btree (provider, provider_account_id);


-- CREATE UNIQUE INDEX sessions_session_token_key ON public.sessions USING btree (session_token);


-- CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);

-- CREATE UNIQUE INDEX verificationtokens_identifier_token_key ON public.verificationtokens USING btree (identifier, token);


-- CREATE UNIQUE INDEX verificationtokens_token_key ON public.verificationtokens USING btree (token);


-- ALTER TABLE ONLY public."Post"
--     ADD CONSTRAINT "Post_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


-- ALTER TABLE ONLY public.accounts
--     ADD CONSTRAINT accounts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- ALTER TABLE ONLY public.sessions
--     ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;

