PGDMP      )                |            Desafio de Banco de Dados    17rc1    17rc1 &               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    16388    Desafio de Banco de Dados    DATABASE     �   CREATE DATABASE "Desafio de Banco de Dados" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
 +   DROP DATABASE "Desafio de Banco de Dados";
                     postgres    false            �            1259    16390 	   cadastros    TABLE     :  CREATE TABLE public.cadastros (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    cpfcnpj character varying(14) NOT NULL,
    cep character varying(8) NOT NULL,
    estado character varying(2) NOT NULL,
    cidade character varying(40) NOT NULL,
    endereco character varying(100) NOT NULL
);
    DROP TABLE public.cadastros;
       public         heap r       postgres    false            �            1259    16389    cadastros_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cadastros_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.cadastros_id_seq;
       public               postgres    false    218                       0    0    cadastros_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.cadastros_id_seq OWNED BY public.cadastros.id;
          public               postgres    false    217            �            1259    16405    cadastros_tag    TABLE     e   CREATE TABLE public.cadastros_tag (
    cadastro_id integer NOT NULL,
    tag_id integer NOT NULL
);
 !   DROP TABLE public.cadastros_tag;
       public         heap r       postgres    false            �            1259    16421 	   categoria    TABLE     f   CREATE TABLE public.categoria (
    id integer NOT NULL,
    titulo character varying(50) NOT NULL
);
    DROP TABLE public.categoria;
       public         heap r       postgres    false            �            1259    16420    categoria_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.categoria_id_seq;
       public               postgres    false    221                       0    0    categoria_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;
          public               postgres    false    220            �            1259    16489    lancamentos    TABLE     ~  CREATE TABLE public.lancamentos (
    id integer NOT NULL,
    tipo character varying(7) NOT NULL,
    status character varying(9) NOT NULL,
    descricao text NOT NULL,
    valor numeric(10,2) NOT NULL,
    valor_liquidado numeric(10,2),
    vencimento date NOT NULL,
    liquidacao date,
    cadastro_id integer,
    categoria_id integer,
    CONSTRAINT lancamentos_status_check CHECK (((status)::text = ANY ((ARRAY['aberto'::character varying, 'liquidado'::character varying])::text[]))),
    CONSTRAINT lancamentos_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['pagar'::character varying, 'receber'::character varying])::text[])))
);
    DROP TABLE public.lancamentos;
       public         heap r       postgres    false            �            1259    16488    lancamentos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lancamentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.lancamentos_id_seq;
       public               postgres    false    225                       0    0    lancamentos_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.lancamentos_id_seq OWNED BY public.lancamentos.id;
          public               postgres    false    224            �            1259    16466    tags    TABLE     a   CREATE TABLE public.tags (
    id integer NOT NULL,
    titulo character varying(50) NOT NULL
);
    DROP TABLE public.tags;
       public         heap r       postgres    false            �            1259    16465    tags_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.tags_id_seq;
       public               postgres    false    223                        0    0    tags_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;
          public               postgres    false    222            j           2604    16393    cadastros id    DEFAULT     l   ALTER TABLE ONLY public.cadastros ALTER COLUMN id SET DEFAULT nextval('public.cadastros_id_seq'::regclass);
 ;   ALTER TABLE public.cadastros ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            k           2604    16424    categoria id    DEFAULT     l   ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);
 ;   ALTER TABLE public.categoria ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    221    221            m           2604    16492    lancamentos id    DEFAULT     p   ALTER TABLE ONLY public.lancamentos ALTER COLUMN id SET DEFAULT nextval('public.lancamentos_id_seq'::regclass);
 =   ALTER TABLE public.lancamentos ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    225    225            l           2604    16469    tags id    DEFAULT     b   ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);
 6   ALTER TABLE public.tags ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    223    223                      0    16390 	   cadastros 
   TABLE DATA           U   COPY public.cadastros (id, nome, cpfcnpj, cep, estado, cidade, endereco) FROM stdin;
    public               postgres    false    218   �,                 0    16405    cadastros_tag 
   TABLE DATA           <   COPY public.cadastros_tag (cadastro_id, tag_id) FROM stdin;
    public               postgres    false    219   +6                 0    16421 	   categoria 
   TABLE DATA           /   COPY public.categoria (id, titulo) FROM stdin;
    public               postgres    false    221   \6                 0    16489    lancamentos 
   TABLE DATA           �   COPY public.lancamentos (id, tipo, status, descricao, valor, valor_liquidado, vencimento, liquidacao, cadastro_id, categoria_id) FROM stdin;
    public               postgres    false    225   �6                 0    16466    tags 
   TABLE DATA           *   COPY public.tags (id, titulo) FROM stdin;
    public               postgres    false    223   �H       !           0    0    cadastros_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.cadastros_id_seq', 108, true);
          public               postgres    false    217            "           0    0    categoria_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categoria_id_seq', 10, true);
          public               postgres    false    220            #           0    0    lancamentos_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.lancamentos_id_seq', 1179, true);
          public               postgres    false    224            $           0    0    tags_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.tags_id_seq', 10, true);
          public               postgres    false    222            q           2606    16395    cadastros cadastros_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.cadastros
    ADD CONSTRAINT cadastros_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.cadastros DROP CONSTRAINT cadastros_pkey;
       public                 postgres    false    218            s           2606    16409     cadastros_tag cadastros_tag_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.cadastros_tag
    ADD CONSTRAINT cadastros_tag_pkey PRIMARY KEY (cadastro_id, tag_id);
 J   ALTER TABLE ONLY public.cadastros_tag DROP CONSTRAINT cadastros_tag_pkey;
       public                 postgres    false    219    219            u           2606    16426    categoria categoria_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public                 postgres    false    221            y           2606    16498    lancamentos lancamentos_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.lancamentos
    ADD CONSTRAINT lancamentos_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.lancamentos DROP CONSTRAINT lancamentos_pkey;
       public                 postgres    false    225            w           2606    16471    tags tags_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_pkey;
       public                 postgres    false    223            z           2606    16410 ,   cadastros_tag cadastros_tag_cadastro_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cadastros_tag
    ADD CONSTRAINT cadastros_tag_cadastro_id_fkey FOREIGN KEY (cadastro_id) REFERENCES public.cadastros(id);
 V   ALTER TABLE ONLY public.cadastros_tag DROP CONSTRAINT cadastros_tag_cadastro_id_fkey;
       public               postgres    false    4721    219    218            {           2606    16499 (   lancamentos lancamentos_cadastro_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lancamentos
    ADD CONSTRAINT lancamentos_cadastro_id_fkey FOREIGN KEY (cadastro_id) REFERENCES public.cadastros(id);
 R   ALTER TABLE ONLY public.lancamentos DROP CONSTRAINT lancamentos_cadastro_id_fkey;
       public               postgres    false    218    4721    225            |           2606    16504 )   lancamentos lancamentos_categoria_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lancamentos
    ADD CONSTRAINT lancamentos_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categoria(id);
 S   ALTER TABLE ONLY public.lancamentos DROP CONSTRAINT lancamentos_categoria_id_fkey;
       public               postgres    false    221    4725    225               �	  x��ZMr��^7O�hT��$iS�J�0�J�Je�$[TO@���f�Jΐhf�r��rV��&9I�� A��$�.[�(�u�{��{9l��o/RYc��*��q=?�al;�u}��6�fs�g-�k�
��_Z2[]�k3��O�ۅ�x���������n���+���2�؉�xv�[�؄o�e�3��N_Z�4/��b�	�r����kua����2��Y&-a��^=ɋ��>f|)�DІ�5Uɯ�Y��X�خ�6��gs������_����߬��nU����r��ǲ|#��]�"��
��t-2�_��i� ����ν�b�f�ځ�ܢ���Eb*r/�Z!_�Kd,|ĝ�􉊖B�]�	U+��l5�i�����9^�l>b�̱ğ/�L�\Y�Dl�`��K��FdT�[�6{��<ǵi��KN���g�!{�.��6�|�2�_axJfb6�XY˕�Q�<a��1�n`;!r3g�B�\.9�k��_d�#^����F1B��� {B�����_j)k&4�l��+3��F[ �ر�rS ��b��qٵ����U!�\��c��ZnOhr^s_j"xvV;>�oz�5��TZ~������^�+�-��`��P���ٕ��o����[f�#8�wĮ��������k�ܽt̗���k�����s�M���}�Dl����T)"[?&��`���(����F)��N�M���zF��,?!��
�r/d*�5QY�e�i�v�N�����s�a���얧�?Ql��e�u&�H���eq��r}H�)_���;@T&/���S�ԧ���[��lP�}��2RnM�Uc��Wޡ���;�#��j!7�-��3r������"��=���ZnS���n���{��6]	Y~���	����j^��M�V�h��g�n�F(I+em���2@u�<�c�Q��	!����O�C�^a�9��Hc��&�g�����W̀�>(-_�UAM/nŶ�$E3$Tߩ���Ʈq.��\j�)�i��{t&�ch�'��uW�ⵣ���g7
���QGN����9�7[o$j�a~?d�BB���FO���E�҅�܈g$�9����g�����^�7��-�J���ٰo��_ф"Uw�;t������p����\�i�%��O�Ȫ����L��,��[A-L���6����������_ު����,��}Mʨ��Ҧ�����M��I�o��6�{T^?b3�c�H��Ț��g��H�a��f���;l?q�<i��C�sE���C�V�u��?�=�]I�=��1�F��Sh�ז$��*�5�_�����ǔ��m�/�xS�3��(�`)}��?�A�3>^�mB���!�.���&��뾚� ���\��Ծ[u�6�c�c�N����!]��`�Ѧ���= ���=�*�� �,�};u4�?�s9�ݥ��Ѧ�)W���@P�u�r��[�����=>q35V��7�#{w_z����'u,���|���rN�̡ڌ>BZn�2�yԔ{dA�)_v����(`2�\�Q>�Q��y�C��}_�E�a��ϵ�Y�/�@r�Ե�|O6�M��=�{D�p���_����S_VG9͇.� R-.D��]��H�P[�+��������=v���%��Ci�����M���-���{h��R���X�`���׻�uh�⣍�ǝf�)$�ȯ-l3؝��'%�����<��r������v_,�]��K����g�Q� ���2�IR�k�Mυ9:&�!���Np�^�v���n�5��F�w��yjo�[=���+4�Z�'��������w_|�����ږ�_��z�Jw )�#r���čw�l��6��]��q�e�2���B���_0�3Z�A���[���m����#�r�_�[��3��ő�����ݹ�&�@���ڭw���k�X�JaXǶI�hb8�x�B�ȫ���?�B웱�����)�m���s^U���b3U~RY��d]���;�!�i �n���c��p9py�(�˯�*�M�k.�X��m�I.�ɉ�����#~��Sw��Qz�����g�G��w8�̠��	�=���3���?찖ཛ 8�z�W�����u�#��I���W�u�е�/Uڠ�	���]�wCb��!��".y~Ψ�~�
B)��:�X6-ߖ���� y" Ř�v���fd;6z��c��J�>���8�g�@꽵I���#Ν�ѱ}��T��U`<Ǽ:�%0�P\�,�'ힺ�7��Ch=r��Ev�d��OVUC�!z@M�ЙJ+M�8�g{;/�6[	9`J-��0Q��.Ձ�#}����n� ���1I�����0;�#v��68�6���#�u��U�/d����r�N����X�S�E<�zt�ي��d2i���$寗�����         !   x�3�4�2�4�2�4�2�4�2�4����� (&	            x�%�;
1@�È��r�fAP�l;.�8���B{�\̠�{��A�|rJ��;��p�<�e���������:7��s`7�:�O�=��@j��м��"Ox��P���-c��)qɩ�?z,���/            x���M�$�q���Uh$�����Z�&-�!4 �RK\�Z7&{���k�Dw��uy�u����x����˯����_��?��o_�����������������ן_����|M��+�$�/��~�����_��߿������o����Y��#�ݒ�]����kV��
ɗ���x}����5��B���Oܑt����^UI�+d_�(4�B�n����m!��w��-�,4�ի*)v��+��U���k*fm������-�,4�ի*)w��+*\��[��Ǩ�]�:�;$��������꿕�v�v<j���p���~�u�u��v��j���v�u�%W�n8z�c��:���k·���t�^�خ�������G}�^����ig/�^=��{]G<z�ի+��������!vK;{Y��͏���:����WW=���������-��������������;���O>�k�ǧ��-�,]��?�ï�|]��{�s?�:�c��uK;{���ß���u>��W�w������~�-���~���v�u���O³b�_�y�O�uK;z�����?�ï�|�| �{�������2�v��|y_�ï�<�?��wG���~�u��K_���X�K_�_hj��_�ǣ���e?�:�������'���e;���=z��QQz��~����[����~��e;��J<z����~��e?�:�1�e���W?!��/���U��K�^]Qz��~��u~;�����	����v�u��(fW��=|�����������=|�����_������'_�k���yy���^����n�_W}?�^]Q{��~��3|Q�����	�=|������zuE���~�u����_���W?!������U��ϫWW���_g;�vK;{���÷���j�៏ȣ���m?�:�1�|�Ҏb�G���m;���c��#�h=|�������v��O|����o�5��������h=|���v�uv�nig��ķ�m�_W����zB��o����>���;~\O��<!��o�������x����������}����v������������QL�b��{��~����n���X?"���������K�^]�{��~���z���^����o�_W�G/�zuE���O~�S{>��vK;{��{��~]�9|�zuE���~�u���d�uK;{��{��~]�9��zuE���~�u���m�-���O�x?�ïk<���b�1z��~��3|��-�,֏����v�u�����������9>}��v��Gd��c;���c���=��������v�z?!���a֤�?��G����~�u�c��nig��ď~l�_�x\�������~�u^��竷�����������0�u="������ï��߯���zD��#r���v�u]��u�aG���_���y}���w�u="���z�k;��.{�����������>�w�[�٫������ï�G/�zu���_?��}�����nig�~B�����+����W?����)��W�-���O�|?�ïk>��W��=����y?_���X?"������5�Ï�WW�~�_��?^vK;{�#2{��~]�9�u�������뜟a�|���^���~n�_�|?�^]1{��~��3������	�=���UM�1��	yT�~Տz~�Wo�z7��-�h�~F�_Z���N�f'c�������lv26;1����N�f'f���ى��Dmvb6;Q����N�f'f���ى��Dmvb6;Q����N�f'f��ى��dmvb6;Q����N�f'f��ى��Dmvb6;Y����N�f'f��ى��Dmvb6;Q����N�f'f��ى��Dmvb6;Q����N�f'f���ى��Dmvb6;Q����N�f'f��ى��dmvb6;Q����N�f'f��ى��Dmvb6;Y����N�f'f��ى��Dmvb6;Q����N�f'f��ى��Dmvb6;Q����N�f'f���۬06+��
c��٬06+��
c��٬06+��
f�Bڬ`6+��
f��ڬ`6+��
f��ڬ`6+��
f��ڬ`6+��
f��ڬ`6+��
f��ڬ`6+��
f��ڬ`6+��
f��ڬ`6+��
f��ڬ`6+��
f��ڬ`6+��
f��ڬ`6+��
f��ڬ`6+��
f��ڬ`6+��
f��ڬ`6+��
f��ڬ`6+��
f��ڬ`6+��
f��ڬ`6+��
f��ڬ`6+��
f��ڬ`6+��
f��ڬ`6+��
f��ڬ`6+��
f��ڬ`6+��
f��g۬26���*c��٬26���*c��٬26���*f�Jڬb6���*f��ڬb6���*f��ڬb6���*f��ڬb6���*f��ڬb6���*f��ڬb6���*f��ڬb6���*f��ڬb6���*f��ڬb6���*f��ڬb6���*f��ڬb6���*f��ڬb6���*f��ڬb6���*f��ڬb6���*f��ڬb6���*f��ڬb6���*f��ڬb6���*f��ڬb6���*f��ڬb6���*f��ڬb6���*f��ڬb6���*f��ڬb6���*f����6k��f��جa6k��f��جa6k��j��٬�6k��j��٬�6k��j��٬�6k��j��٬�6k��j��٬�6k��k��٬�6k��j��٬�6k��j��٬�6k��j��٬�6k��j��٬�6k��k��٬�6k��j��٬�6k��j��٬�6k��j��٬�6k��j��٬�6k��k��٬�6k��j��٬�6k��j��٬�6k��j��٬�6k��j��٬�6k��k��٬�6k��j��٬�6k��j���l���:c��٬36��:c��٬36��:c��ڬc6��:f��ڬc6��:f��ڬc6��:f��ڬc6��:f��ڬc6��:f��ڬc6��:f��ڬc6��:f��ڬc6��:f��ڬc6��:f��ڬc6��:f��ڬc6��:f��ڬc6��:f��ڬc6��:f��ڬc6��:f��ڬc6��:f��ڬc6��:f��ڬc6��:f��ڬc6��:f��ڬc6��:f��ڬc6��:f��ڬc6��:f��ڬc6��:f��ڬc6[�a��f��`l60��f��`l60��f���l6H��f���l6P��f���l6X��f���l6P��f���l6P��f����l6P��f���l6P��f���l6X��f���l6P��f���l6P��f����l6P��f���l6P��f���l6X��f���l6P��f���l6P��f����l6P��f���l6P��f���l6X��f���l6P��f���l6P��f����l6P��f���l6P��f���l��?a�]��.�fc�������lv16�0�]��.�ff���م��Bmva6�P�]��.�ff���م��Bmva6�P�]��.�ff��م��bmva6�P�]��.�ff��م��Bmva6�X�]��.�ff��م��Bmva6�P�]��.�ff��م��Bmva6�P�]��.�ff���م��Bmva6�P�]��.�ff��م��bmva6�P�]��.�ff��م��Bmva6�X�]��.�ff��م��Bmva6�P�]��.�ff��م��Bmva6�P�]��.�ff��2�f����l6�M�f����l6�M�f���Dm61�M�f��Dm61�M�f��Dm61�M�f��Dm61�M�f��Dm61�M�f��dm61�M�f��Dm61�M�f��Dm61�M�f��Dm61�M�f��Dm61�M�f��dm61�M�f��Dm61�M�f��Dm61�M�f��Dm61�M�f��Dm61�M�f��dm61�M�f��Dm61�M�f��Dm61�M�f��Dm61�M�f��Dm61�M�f��dm61�M�f��Dm61�M�f��Dm61���)g�_��֫(��(�g+�ڊB��r(��(�h+�BڊB�v�P��8�i+
��J����H��8�j+��ڊ����H��8�kǋ�ʣĶ�H��8�l+�Dۊ�Զ�H��8�m+��ۊ��v�X��<�n+��ۊ����H��8�o+�܊���H­8�p �  ǋE�ʣ��Hƭ8�q+��܊�$��Hʭ8�r+��܊�4���*ɹ�GynE��[q��VI�G�nE��[q��VɺG��x��[y��VI�G�nE��[q��VɻG�nE��[q���K��GoE��[q��VɼG9oE��[q��VI�GY�x��[y��VɽGyoE��[q��VI�G�oE��[q���˾�G�oE��[q��VI�G�oE��[q��Vɿ���7���; �����������wp�; ����꿃�������w��;8����쿃�������w��;8����뿃������w��;8����뿃�������w��;8����뿃�������w��;8����뿃�������w��;8����쿃�������w��;8����뿃������w��;8����뿃��������_���Ǐ���!�         k   x�̻
A�:�c��m-,,�V6ar��8������� ��9k����b	l�1�$_L��ڰ�э�M�8HѬ�e�쬴H��Ҝ��,W�aX˝������"�     