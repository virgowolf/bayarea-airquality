PGDMP          
            |           proj3_team3_db    16.2    16.2     .           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            /           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            0           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            1           1262    17493    proj3_team3_db    DATABASE     p   CREATE DATABASE proj3_team3_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE proj3_team3_db;
                postgres    false            �            1259    17494    city_master_table    TABLE     #  CREATE TABLE public.city_master_table (
    city_index integer NOT NULL,
    city character varying(100) NOT NULL,
    month date NOT NULL,
    pm10_max numeric,
    pm25_max numeric,
    ozone_max numeric,
    nitrogen_max numeric,
    carbon_max numeric,
    median_income_2020 numeric
);
 %   DROP TABLE public.city_master_table;
       public         heap    postgres    false            �            1259    17549    income_carbon_merged_table    TABLE     �   CREATE TABLE public.income_carbon_merged_table (
    city_index integer NOT NULL,
    city character varying(100) NOT NULL,
    month date NOT NULL,
    carbon_max numeric,
    median_income_2020 numeric
);
 .   DROP TABLE public.income_carbon_merged_table;
       public         heap    postgres    false            �            1259    17537    income_nitrogen_merged_table    TABLE     �   CREATE TABLE public.income_nitrogen_merged_table (
    city_index integer NOT NULL,
    city character varying(100) NOT NULL,
    month date NOT NULL,
    nitrogen_max numeric,
    median_income_2020 numeric
);
 0   DROP TABLE public.income_nitrogen_merged_table;
       public         heap    postgres    false            �            1259    17525    income_ozone_merged_table    TABLE     �   CREATE TABLE public.income_ozone_merged_table (
    city_index integer NOT NULL,
    city character varying(100) NOT NULL,
    month date NOT NULL,
    ozone_max numeric,
    median_income_2020 numeric
);
 -   DROP TABLE public.income_ozone_merged_table;
       public         heap    postgres    false            �            1259    17501    income_pm10_merged_table    TABLE     �   CREATE TABLE public.income_pm10_merged_table (
    city_index integer NOT NULL,
    city character varying(100) NOT NULL,
    month date NOT NULL,
    pm10_max numeric,
    median_income_2020 numeric
);
 ,   DROP TABLE public.income_pm10_merged_table;
       public         heap    postgres    false            �            1259    17513    income_pm25_merged_table    TABLE     �   CREATE TABLE public.income_pm25_merged_table (
    city_index integer NOT NULL,
    city character varying(100) NOT NULL,
    month date NOT NULL,
    pm25_max numeric,
    median_income_2020 numeric
);
 ,   DROP TABLE public.income_pm25_merged_table;
       public         heap    postgres    false            &          0    17494    city_master_table 
   TABLE DATA           �   COPY public.city_master_table (city_index, city, month, pm10_max, pm25_max, ozone_max, nitrogen_max, carbon_max, median_income_2020) FROM stdin;
    public          postgres    false    215   u)       +          0    17549    income_carbon_merged_table 
   TABLE DATA           m   COPY public.income_carbon_merged_table (city_index, city, month, carbon_max, median_income_2020) FROM stdin;
    public          postgres    false    220   !E       *          0    17537    income_nitrogen_merged_table 
   TABLE DATA           q   COPY public.income_nitrogen_merged_table (city_index, city, month, nitrogen_max, median_income_2020) FROM stdin;
    public          postgres    false    219   �I       )          0    17525    income_ozone_merged_table 
   TABLE DATA           k   COPY public.income_ozone_merged_table (city_index, city, month, ozone_max, median_income_2020) FROM stdin;
    public          postgres    false    218   �O       '          0    17501    income_pm10_merged_table 
   TABLE DATA           i   COPY public.income_pm10_merged_table (city_index, city, month, pm10_max, median_income_2020) FROM stdin;
    public          postgres    false    216   EW       (          0    17513    income_pm25_merged_table 
   TABLE DATA           i   COPY public.income_pm25_merged_table (city_index, city, month, pm25_max, median_income_2020) FROM stdin;
    public          postgres    false    217   MZ       �           2606    17500 (   city_master_table city_master_table_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.city_master_table
    ADD CONSTRAINT city_master_table_pkey PRIMARY KEY (city_index, city, month);
 R   ALTER TABLE ONLY public.city_master_table DROP CONSTRAINT city_master_table_pkey;
       public            postgres    false    215    215    215            �           2606    17555 :   income_carbon_merged_table income_carbon_merged_table_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.income_carbon_merged_table
    ADD CONSTRAINT income_carbon_merged_table_pkey PRIMARY KEY (city, city_index, month);
 d   ALTER TABLE ONLY public.income_carbon_merged_table DROP CONSTRAINT income_carbon_merged_table_pkey;
       public            postgres    false    220    220    220            �           2606    17543 >   income_nitrogen_merged_table income_nitrogen_merged_table_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.income_nitrogen_merged_table
    ADD CONSTRAINT income_nitrogen_merged_table_pkey PRIMARY KEY (city, city_index, month);
 h   ALTER TABLE ONLY public.income_nitrogen_merged_table DROP CONSTRAINT income_nitrogen_merged_table_pkey;
       public            postgres    false    219    219    219            �           2606    17531 8   income_ozone_merged_table income_ozone_merged_table_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.income_ozone_merged_table
    ADD CONSTRAINT income_ozone_merged_table_pkey PRIMARY KEY (city, city_index, month);
 b   ALTER TABLE ONLY public.income_ozone_merged_table DROP CONSTRAINT income_ozone_merged_table_pkey;
       public            postgres    false    218    218    218            �           2606    17507 6   income_pm10_merged_table income_pm10_merged_table_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.income_pm10_merged_table
    ADD CONSTRAINT income_pm10_merged_table_pkey PRIMARY KEY (city, city_index, month);
 `   ALTER TABLE ONLY public.income_pm10_merged_table DROP CONSTRAINT income_pm10_merged_table_pkey;
       public            postgres    false    216    216    216            �           2606    17519 6   income_pm25_merged_table income_pm25_merged_table_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.income_pm25_merged_table
    ADD CONSTRAINT income_pm25_merged_table_pkey PRIMARY KEY (city, city_index, month);
 `   ALTER TABLE ONLY public.income_pm25_merged_table DROP CONSTRAINT income_pm25_merged_table_pkey;
       public            postgres    false    217    217    217            �           2606    17556 P   income_carbon_merged_table income_carbon_merged_table_city_city_index_month_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.income_carbon_merged_table
    ADD CONSTRAINT income_carbon_merged_table_city_city_index_month_fkey FOREIGN KEY (city, city_index, month) REFERENCES public.city_master_table(city, city_index, month);
 z   ALTER TABLE ONLY public.income_carbon_merged_table DROP CONSTRAINT income_carbon_merged_table_city_city_index_month_fkey;
       public          postgres    false    220    220    3463    215    220    215    215            �           2606    17544 T   income_nitrogen_merged_table income_nitrogen_merged_table_city_city_index_month_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.income_nitrogen_merged_table
    ADD CONSTRAINT income_nitrogen_merged_table_city_city_index_month_fkey FOREIGN KEY (city, city_index, month) REFERENCES public.city_master_table(city, city_index, month);
 ~   ALTER TABLE ONLY public.income_nitrogen_merged_table DROP CONSTRAINT income_nitrogen_merged_table_city_city_index_month_fkey;
       public          postgres    false    219    215    215    215    3463    219    219            �           2606    17532 N   income_ozone_merged_table income_ozone_merged_table_city_city_index_month_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.income_ozone_merged_table
    ADD CONSTRAINT income_ozone_merged_table_city_city_index_month_fkey FOREIGN KEY (city, city_index, month) REFERENCES public.city_master_table(city, city_index, month);
 x   ALTER TABLE ONLY public.income_ozone_merged_table DROP CONSTRAINT income_ozone_merged_table_city_city_index_month_fkey;
       public          postgres    false    215    3463    218    215    215    218    218            �           2606    17508 L   income_pm10_merged_table income_pm10_merged_table_city_city_index_month_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.income_pm10_merged_table
    ADD CONSTRAINT income_pm10_merged_table_city_city_index_month_fkey FOREIGN KEY (city, city_index, month) REFERENCES public.city_master_table(city, city_index, month);
 v   ALTER TABLE ONLY public.income_pm10_merged_table DROP CONSTRAINT income_pm10_merged_table_city_city_index_month_fkey;
       public          postgres    false    215    216    3463    215    215    216    216            �           2606    17520 L   income_pm25_merged_table income_pm25_merged_table_city_city_index_month_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.income_pm25_merged_table
    ADD CONSTRAINT income_pm25_merged_table_city_city_index_month_fkey FOREIGN KEY (city, city_index, month) REFERENCES public.city_master_table(city, city_index, month);
 v   ALTER TABLE ONLY public.income_pm25_merged_table DROP CONSTRAINT income_pm25_merged_table_city_city_index_month_fkey;
       public          postgres    false    3463    215    215    215    217    217    217            &      x��]ˮ%��\_}�~�|?�lc`h0�����Fϴt�n������+#��H�p[�G&�,FT����_����QF�N��)�f�C�e�BxK�u!�=�?�i��'D�G�~�f�}��H=����`��Ԋ(��Y����!"C��=��m���d��f=��a�?w�n���'fۺm�h�YW\�͢�V�6�n/[3�:�7'�B��?}z��������Z��ƿe���6�ED�)�Om���f���#��~��( �-��"("���wg�� G�yy�2"|oF�7
��b3���	0A-	x>�apYMg^5B(��:�l��~x����kp�������Z����B�����N�L�%�$[��21 YZ�ZƑJK�Z6:#[����ډ�]L�� X�N:r��3W'�Oh�E�>�o���������O����������{��H�0Gk��D��J�d�o4��� �D-�t��"�"`�8���$����T a��q#$�1m%��:9̕��ǚ;�P ��ǷO[��f�,�O.ss��&�{��)E�s����47ܼ�U�'斛S�ڳ�8fO�ßL���\;�l��Y��G�yZ�����Fޗ����'3ȭy��˾ �}0v9@7s����`n��v,}���������s����F�`?�'�<�9�|���ӂ��ys?�Gt��@0�.��`Nn�����?}�#u�9��g�h��H�Y�wh�F��s��ˀ��4BG��h?O5�}B�0_7�>�}?cK�I��u(�k|��p@���>N��x�{��������˗m{(����ۦ��ǫ�ςy �;!���B�O���E�mKK��`N����,o�`����������csn������M�,ј_�L�v��g��N7�����z���7��� ��i�&�0f���Z�@�z8�WQ ��Ҧ��7�dJ�c�zo(ӆ��b2u��E�#)���f[���$uk�߻�r�����搴y���/_?��Z�Z����'���M��\��1?6k�Y����M�
��Ck�>�6;"��GbWi:�6f��WiGh�0��e���<0s��6ذ����wDz�X�y���<m~0���*~��X����aR�{���~�����O<8�W�K��� 0;�dl~G\�i*���I�DRT�M��M�^����&�2�^ӏU`�}Y}����8A@~�ձ5�	���9&���}�`.�# 2��B�$q4SO�l9� �B�?�MϞ�m���i�dx��kؗ��5~m���a��������fOL�G����V�qn�mX�y�C�	qn4g?�	qxM:M1o� ���<�I ���0/�T����?������|sOF��pI`�e	�w�l�!�����֛u�u�d�Bm�X�#�7lyC91�a{� i����qG�2�=3�{�XR����ݼDr�����#�R��ջ�t��s��A���˧�o����+ߩB9��z��Ƞ�DA���b��<��m)�R½�>���`uX������� �vX9��S9w*�|,�����y������@쇌((��"ƃb�P��һ��0w��u8���O?��������78����0�NǓd�N3���T^S�e8Xb^�y�S�^�p��p�Q¥W6�-�$�2�g���\[t�'ŝ�y�����JZ���k�-n��GP%׆&K ���t�y�-��(;���df�1��D�dz�3��t�.8��ּ�D�n�̆i��#�ui���{�	��:X"���,�vKh6���/��mN��e��0��)�����E�M����ꙍ5n������0�N�Hp���,kM+���*��^�������{���b�+g
�A\zfᨦ'��e�@ɳ'Ź�e}�f�#�Vj�ļ�_�  k��j�Br���1eo�Y�h�@~;i�Q�q~=4h�,Q� 6��F
0n ��6�p��ѯ /�Z8� ����:6���{������|�w��Mo������7�!����T�E�*�(d���qC����� �4/����W�F�Ն�x�+��^o���00}��)��_NHǉ�R�&P�n����^�V�@(Z�E~��F�w����[a�T+P�~ॏ�%&>������|p?%����. �y� �[ӱuX�s��;��y��*��֋�'�͔�??��*���`�Jq魱�(6e	�����(��P�^��m�{q��@s��As���9�y	G��,Vv���2�_�|��\��^U��*�g�j�Ҡ��MoHd��A��&.1H�!(R�2���-��+�q;�o�^3{��!�z� zw�ǝ�[���3Ǐ��_�h�����,����)�T��RQ���a���+�]��%	L�6&���%�K��lCGpʛ����=1�՞3ޢ�)
�=���t�~��[ɾ<��Y�$9����O��	 x�>����s�E	���B<I��-t��������>�����<&i,�ʋs�� �z;:@� ����1+vlF_9sH� ~~H �N�������%s�Bϭ��/'b�Jgl���9DK7׷�ki,V��we�9Djũ��]R�=�tk�?8�H�z<>\�:`x��K¿���A����D�^�� Xo��Z�R
r������dD�ꃶ�R��W�'k/e}�O7[w)��-̬`��6��ai!������z��o��h�k�� F ��l`��p�,���.�%���P NO�c�ޥ, ���.G���1�r(� ˺$��س{|�h�g /�X�]�q7;�������HA�.	ߑ�i�����Y:���ٜP�>���7c����S�������Z�P�b����[W��T�ε�-����Q���KLS����?�����D�g+���aP���v��8j���Y=�KQ�t{.y�>/��|�<4O��kV�ؙ�ít�c�؝�״�ks�D�.���\�&0ľu��=��߾���o߸}P��q�-�,���q�$Z��"&�>�a<`���2� /a�~:6�a���3��ٔ��ľ�)�+b�\kIF��_�5`��X;w��q��9X_	� K��l�ɝ����--�G�������b�<���H�7]�{@�m$]H{��7�|�\�o.�|!\��3G�͹qL�H�ٞ��v�oU+�|�/ݞ���ʾ[,w�R���p���x).|�W���Em^la:*�|��듹��+u���a��%(}���.��we��d�}�3�UZ�J��s�VN�J�H�W1fiÚ;[I=Z�[%�����˝��Qb���g�TN�^(��2�v��_=f�R)�{��ў]�{E�4v�qZ�(Eg�ɤ���ڦ�HR�q�Uw�L�q��{�0��F�t���ɜ����{��iŽ�g��\���uJL�s �rSn^�)�0[��eJ\���@�:�$6���^Y����ded��<3�/-�$j뾟G�NO�����w3�Y�fE`X�/�ی��<�v��Fד�$(:e}��jfC:&���F�Z�1���.TLFl'.!mA�dO0�x�����:f	Ib&/a�[MmA��y[2�5[1y�1[��� �ڸ�k�n3!;�V侭l����̲�;5�R�>���vN�0L�s��I��1K�w'�.1'5 ��rwR��ρY������5y�l��y[N+�mF��e-���� `��u�<�;�Фڣ��)�z��Ѡ�����s��LI-7��Z�(��[�����V����=%����-�e�B�#N����q��,+<�U��cZ�kn�dL�"B�Y�c��~�����{!s��AcYD#!\e"HȊ ��¨��~.��-�ِ�Z��Q*��vlkH����RA~y�5S~����[N�p�/��>�%�"F�As0�<�K�K���-�N��͋��Y�w�����DX�;	��(��1�ޑ	+{8,Y2�摩��ƝP�Ȅ����$uB�#�c�%[���"Ȯ�'���K �  �BDXiLj�֌�Ŗ�*N�b,P2�a���JM��:�lKBi(��0��	Z��a�9(��U]f�+�@e�6��x���y� ���N{�j��Ϣ�[0C:���"�[ �H������J��$ȵ�8�*+��w�d�a�5�A2_�=F�K!����{.q���q��>q���]�Q\��$Ē ���V/!�CX9%]Ju�0�Fsyk��^�t���9�3+��y W4��� �(T��O蟋���j� �{sۉ�%j=�n��Ò�Y=B��C'��>��x,��Y� �m�V���A�
"��J-��+{sU+hB�|U����~�%�:R�>k�p-Ɉ�������Mi_�xAIT�{�T����TIԿ�^F�)�0�L�����C��PÀ:��!;*�j�0�V����?����{}E��G>ըa@}E]B�<�u,���I5|d�
h9��6����ϯI���^]QA���,��\X�}XE#���q�[7|�W�ʘ��P��խ�2.�#���+\e�VՌ���50��'�㢽�5p����?�
]�ܦ#�؋]�O�&ו�F��F.�R���糪�J2w�8��%P�u�k]�#1Y�OczD�X&6��5k�����ִ"b���X��h`e)WƑ$磥^YE��q*�erC!�8<y"O8NEANYaN��T4�����^��:���Ì`u��@��֠���PN�F9Py~�T5�wEXƜ��^(��E��^�jD�
�Ԝ;/T؉'(?��c�^*��SI�#<��uy��r_�����As��aay^��hJ��!��Q�WF��H"H=�lJ�yXzf� j�V����I�����8��?'jPA�|V�}Q��چ����	��x����GA�����3c�	���b��)O_R��1�2�U|������aF"/��t8��b;#��Ί�_)�3�_��ei�Ӵ���QQ� h�����:APQ0�x�r�TQ�
�G�(�PHq8q�(�PHQ���#?DY��R���RY��*
��L�4APԜY��#�T��?���(Ћu�K6�^���$�YP�A�K���F�@����e���hx�
�����=�U�3�核>A��+��9�8�@����'�	�<�^�'м��g�&���·:{�[�2��A�mc�̠L@uF�i?2(TPB��f��*�v6�zѥK���㐓Q� �7�ǎH�w�V��6oE2*@iAs��T�0D-��q_�P� Z��#4{��K�D�"�&���<��_��M`���n������$[c��;��%�ju�~��Ֆ.�
�ٸ�\�@<��e;���i��I�(����;3a/�t��ST�%T�QR��ϼ"Ԃ.���[��Q��Z��B�$�>-�@�Q3BY@#���J yƳR���_��g���q���������Y�-�3B兀[og�^Y *�v�3��Y�����ٕ�AhA(5�܀2A �i"�X�	�O��Ǿ2k1]�Z����,�t�ghYO�=��Y(�o�9k0]�3j�Yn�f	�+!H뚝�j_ѩP����Y��JAM��0��jVy���'UUBr�"��#VVBr�M9I���g���e�9�@��򌖆�x*����g�t
�Z��֓|��*�Ԃ2ޤ*��J(�8�#?E�Pjqj�/�0�����9�FB����O�
#��������H�d-��|10��'f�	狁�mm��C9$`g���:S��������WDB��ٮ��I(��:��\�/�����A~`Gbu�=�@`g��N�����J(=�U��b@/[}�p�#9��Զ���9�s��-Va�Ʃ�Ůr�7t�1�����7�I<���EϮ�1F�m��J�ސnd]��.��EReboxBr`Km������u��qce_o�Jr ���˯mG������7�[��M��z�5�۽��Q�Һ4���H�P��{j�Z�&XS)�{Z��!W������o��ʹ�3a�4������B+W��{v�Z�%;ce`�9Lj��	*{O/����,w��`6�)��Z��e�C~A�R����V��5��X�-�X$md*�V2�+p6"뵂�@���C"$�Z�HDQ���t�'҆GX�u�&Od()S�w�J�F�ҘZ����F�!�+��GF������N�ڷc�$�F�ZhƏy�5�
	�i<�G�����EOd��Y��}�U#-C/�w2�D�k7��}��;��-E/rx"�H�K�ދ��VQ'�[]%x_���ܼ��c6��8���R�?i�A�J��È�ȱ���dFdoh�P�?\.���ɟ��m�A��D&�p�d�Nd�ט����/Q}4/��4�K��	��D�N�1)�P��՝{.В��~E<<@'��U�o�h;�{�O5H��z��!���UC�s�(*��N�ޱS�TJ����a����"��f:g{�3�Q��%��s�j?���;� �S�w��U+����;P�?���̩�~),q$G�Z�Iw�}�B:{ǐ���>!'1dy8� {.�]FN"�h���\�GF���SF*N�Ț#��3~,d����3�]$����v�a僧#ER��E"w(�v��"�'O�z�b��"q4�h\_'ao� �YK���e�C��i�[F��!��;{K)������[��b�溳��<�s���l�-[�f�����O��9@B,�w�b�����?�7�F��~�7@��>�0G� �CP��x.���}�� ��\}�C+��n�
��\._�
�A��]"�
��"���>�(J\��7>�J�H����ʇ���M�Q�����^����$�Fc|�a�Y�#i�O��L�Ah��gr$��H��Hs��p̭�T|�7��n��/�O:��]�r��|��'� &���mP��?n��m#Y�yz<�����w��?Ȥs�      +   �  x�mؽ�7�z�)�>H�wm E��p�Ti�w��b������(m;?h4$EIk.����ϗ2��h��<�K	&�ͪǖ�KHbHY��c��)�����u�c>A�(&d�`�2I�E&7��ɇ�O����@a��q[Ï]��a�B�aUt�D.��D�������������u�@�{!q�x��-�5{{�P!�0�3?L�W�����eN��$�L/H����dMG,b���8c"�HD?�}��߆�����d��((dY�fFqDF�%�dNϳz.ُu幆�B( ��9��TZt��*���"F���D�3�m$���E�~N:�Rdk���P�~�0�x�|}�������|M[]�6�̘ͥ	���'�<C���,��
z3C�n�F
h�W�op�i�e�,i@7Ct�r4���L���1��Bj���� ���� �a��|���������ӷ������ȷP�ű���-5�z���(��KԮh�P�R��rA�����ڥF�jԖH._�aE��ȒW����
J��s��_�_��J������ᗟ������]}9wfKdc٢]����QY�Rbېv �--2:Z�� �dذ�-���K+�G����MK+%1�K�V	=dYɶ􆷧e�ZQ���.��ʅ7TX�د��ױ%��͉��vKN1|O�3��L�C���hA�$,65A��Rg�4s�*c�5�h���
Vt(pN!���e�GfL�f��frV1m^Y���N�}ֱ�ш#q�?�_�j�%*��i�ab8�q�'�"M!ޗ'V�L'�kf�L�=Q"�V��2�����Ĥ�ߋ�9Ͱ>K�6�)���]7��v1�+9�_���׫�Ht�AJ������9���N�*Ϫ]wR	\��$��U��3;�V�X@;C��g�hrV݆�"}\��3o.�a�"mp��v'�"'x5��������~�qא�:�R�-ϔ	"<�)*6Xo�ӈ(���"� �f���f��ľ�~�8���0�P��˸4g�k��1i�����/Y�̠z<sfP=�W���z�s�^_�� WD
)���R�[��Rm�8��8e�J��2�����
J�]q��R�z��<�[�����H�;WTQcac�mZ��A�Հ�7>�ˆ�_O۶���W�      *     x�m�K�7�u�)|"�^�"��ʦl�'�ic�H��GU������A%���w��O����������%;C,�Ғ��J�	�!�|�,�xCم�3P�PZQt��L�muD��҄򊒣�HI�H�ڡnv+�2�\9�S����Pp��Jj�^'��8�D�Im��}&k*�M�<�Ef��ntė_��s{�v��g�7Ve�($O�� 8���_0��d
��si����"q
�����ų:�a�e�jܖ@�U���fܖ��5�X8��IjW�s�d !�Ǭ�	�ۧ/��2����+��r���|_�\��R+E�r��/�j.��B�@j����[p��D��Y21���"�W*�~�g�r��A{dE�����jmMI�e{B�O�knY�a:=�J���ϨD������|�m��iy>��P]��fe���ayT-�PujJ��:�t�j���[z�H�6��ņZPdAѤ�/ߓ�'P0�&�0��)*N*b��Ӥj�5TM�.Iz	F����=�|�~�c���-�����a�7�d��u ���C%I-��L�x�u9IVj71d�le�z������r����|�SٶV�,�y�f�R�C���VH>|�$B���M�DH�IX���_>�>�{�~����u���`r�!\{Q9��J�oX>�IRS��aÙ���=T<S	ۗ,C��f�,�Qi>�8W9�(-g�b�]υ��3*�v�]���q����E�4������Ek���/�/�o~zY�?}}�t?�����`��Z�F/�ct��)�����tڍ�lLǖ�)�:�ǖ�)��̮a���S��W>LE;�	}H�>T:R�g8:m���R�J�F�#�8��F���Z�����|�M=h�(������kM�È�����F�����PΨpu�_�â�Eqmv�Ch~&��SK1�O6�]FAC��%���\�����J���xR�T���H���5N"�~��tH��N*��r��bc��M
�0���X35��yoX�$��ȸ,����kV�a����qU>�.���\��f�suO:9I)4� ��〢�����[��H|X�,�����-�Z��u�,$�ű�!����%�6��n�l�l����
d���^xTE�pe�x�L�X�䨣0[�,��s*,"��q$64�8�a�0��SHְ|���4�i��S�4KdN��Z쿇d#5'<�*��zoLR�F�MtB�S����J˾�l�,�(F�G��*�����&>`30��)�`��}z�Ri�ou�N�=,�������!��\�S?�tD���� mk�rs�G0���-���
<d�ҫa�X�d}�y���f��S٬�2}�����-lX�x $;{^��mE)���I�AڀH����&�x�cyz��u<����eQRI��4���%y�P�'�R�L@ౙ:)l�xWP�&U��$T�!Y���Ȱy�W�m-*�n��ĭ*L��5Y\��7T���y��RO�������F�      )   ^  x�m�ɮT7 �����@��5DQD"��bsy�A�4�Q?��㩪쪻�#OU.۷�����p�?nF�R�Jo���d�e�B8��h5��ɀ1��0����a,k�c��fǌ����Зg}�qF�a3Ǔ���`J3a�ČC�S&3��$5��b(R�à5[i� �< ���/�ϗ�UJ{c��l�'m�qe�-0'��&c=0/��-Y0X�����a�ٺ��%�0�j[�3���Ό�E�)��h����0S#���l��	��f�S5�s����~�����Mk�9�
h�]�	PXm�PP\��h3���uA�uL�`����Z惫��^���fETbj� �Q���Ė��O��؊cx��R�~���e-
V�ze�Χ�a�V@;J��rm�w�W���mKw�C<[-�H�� x��%�0���Ycw�u��3 k&,90�g"�U����v�����M�vW���_�?�w�2/��w[�^��R�Ex%D�<	-��0R�UX)�*�v^
6� �m��]�sVkK+W!W�'2���?.?��������%w�FU���;����,:#ڃ|w���p���	��9/�yA8�G��.
�%��:.	�;ҪH�f�(�6��"td�i|Q�K&�������37�p�A�N�r�q(GB=��s�E[9�y����0\c��Q4\��c=���D{[���7\�� -?�KJ8:��?��b[� 8<���9���n�Grۻ��·��MG;}J~|S.q��Ǖ��8E{�Ԧ!�<�鮖�!�,(������f�Y�j��g��i��̂"��bg��Y%�J^V�n����W���Ӛ����{ݟģ*��c2:�S�M�ٺl�aw�h-���<h�ېV�)����P�),���wP�)����e
��ި�S�&��3�I��/�Z6*(��a�^.C������������;��Y��l���һ�U�aˣ��b��X}d1��Ү9����֋�Y�i'Xwd1�S�� N�J�pd�UTsh�� 0������)-�(hSƴ;ly�~؟^���O�燛xx�s��Ӹ�f0���s�9l��I�C�uT��`w�����(b8`�X~n9�LIٮ ��!��Rr�p:�X�B����Ӟk7���q�0�m����8|t���?p��gqO�)Ԝ(������Ǆ��n�q��ƞ6�y�����7\�+B�)0\��S�����ê�{5.s�(���9�f��X�i��xQ����AAn�t<�(Һ����OW��ڗ�S=�y�2m��0��p�:.�	\.�$N��- .�65 �y%ܺY�i�z��3�=J�X�h��"}4Y/�1E�f������|�h_�J��b���a0	H��_��b��kf��$��V��=���.��$@#!]?j�h%�uL�s��NB
L�~�^B��-���LW��o���P����!2_oO<���Ų־���4TQ	EG�-��PHy�
�H�:MZ�0��� �Čqe�ҳ-RQot �KM��
a����
�-Iɐ�˯U��S���������&�&�גϹ���V�U���
�H}���Z	#��.�IHw���z	�LiW�A@ZEW� `��r��w�IvM/�y�YB�(�Gy�� 2��n/�ed(mm{�h�������z�������sW^��ѧ�V�s�ѧ��O`w^8G��NpA8�#��y����g�y|I8��;D�����Vg��v'"�єS4��pt2��k�a��B�d��0�8��}����v́
��?�J�YK��樿��E݅�2Sto��z(�����k΂�L�V��҆!�"Ԏe�^�H�zO��y@l�)�����t�q$+      '   �  x�m��j1��3O��bI�{.��C(-���d����[���-9������,�<6����|{{ZР�3����nI�x� �CQqP��i]^jX���Y��nP)'%k��B9�*d��8�y_"V��j/̠����^f���b%6���y�<�?�}{is#8�a88�HS9GL'��Th����t�tdON��_�k9"&h��A������Ŵ��8rҔ�p��WL�6�#�����������.]�4NJb��A��o��-i�쮹VCnh�|��k��,�k��ʀE�R���:kdZ-�������(��UEj�������D�u�1<�r@��������v=���o]��cs�i�0�8T*N)S��Ri�c9�A���b��b�`JéR8ML�G(��r|]e��eǅrS*7U[��|��S��>�b����sWC���ѱi\-r��2��0�zS �\��(e��=�@��q�΍ �˧~��LD��Te��C ee)l=�/V~�/}���#��z�$@��� z�*@&���(�ؿ�LxE�u�@P@i�(@T@i� @R��Q*@�V"76��z{1P����ޞ/� .)ِ�@���!	a5a��L8�����\&�&���DԄ�'c!�&�I�D4�0�}L����!qb��wѦ�[2�v������Kw�<��:<%��{����r�
��(�����5����H��]�ɨ,�>L3 *��#��H��K��e�WN�����      (   �  x�m�͎�6 ��)�1$�������^��)��t&�]���WI�"�9���!)J�Y>=�O�����&4v�f-6Ƙ�L�+Pڑ�5�@�m��� �8a|Ŭ`�s���5dװFA h�g�S۞�չ�I�8{O��[JG*���
k�h����c�A��gˏ/����0fu5���b�HڄSYO���b`�M�YY+��V�e�*����5c|X�Qa��|c���p̽��sf]tѳ3**� 6�ґQ��t����:4����I��7N:� �_~~�������:TRh/t�غ��B���k�aT����[�v�$����`�3�
r�Z�I�hq�pF	^��x�s�VA��,v�\D�i ������4`Y�""�T*x1�j�hI����6d?-9[o/.��h�C&���ؽ(�q9?n���o΄s���gO�����9%b|�;���2��ς���p~�j&DΡ�J{�!����@�����m��}=ԝ��.��
�ra��(��Rk���
���.k�*s�b��O����G��P-�6�c�A�pZD� ��"�[6�$��J�h4C�D�1À5�D4���u{�����c׊�F���D���R�F�4ܠ�ϐtzL\��q�0�zPju����Ӡi��}$�����N�&�b7YN,ˢ%'��x�Ig����J'����K�|�>��x<���>��t�;wInf�L@�����ރ�q������ƙMcgb�f�;vۄ��
�}_#\&+ӧ���ffy�qR�ڙ�c�4k�DSF�t�4>��ᄬ_�n�?�n�����ǐ5�gZ �%������I8Nq�e��p�b�p�*O��c�2U�\��p1S�UP3�݉���^���zX��΁�7��ϳŻ���4aT^�X��1a?=ކì;��q�^J�_�z�����tE�����1z�m�a�4����K�=K�[<y�3A'G�z㽷C/!��-!RA��gY81��@B�!�ڬ0	��o��T$����"!���HX���e����*�/r�c
b\�<��)�����W�;U%à����`T�ѫ��٤ ��/Tz����ᎀ &����v���������S��*���R�/g�:�tZR��O5$��#��'�e�2��˨%V_��IS���v.�2kɇ��Y-���>�!s��Pg�D�+��(���������1D�^�s(�.�%�|"�[I�%N� A�o�-�e�3��&ڀ�&M�f���ǠYK��A=��h�ѾNH�˸R�e)3�Wr�/�'��.K��Q��_~�n��c[(��RH�T�iI�}z������%�-v���e����gdfE0Z�N��n"������h�x
`��/nX�̜�5��3	��x�390�H����^.���-:     