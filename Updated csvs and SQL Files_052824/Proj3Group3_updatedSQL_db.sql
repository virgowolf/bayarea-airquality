PGDMP  	                    |           proj3_team3_db    16.2    16.2     "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            %           1262    17493    proj3_team3_db    DATABASE     p   CREATE DATABASE proj3_team3_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE proj3_team3_db;
                postgres    false            �            1259    17741    carbon    TABLE     �   CREATE TABLE public.carbon (
    city_index integer NOT NULL,
    city character varying(100) NOT NULL,
    carbon_month character varying(30) NOT NULL,
    carbon_max numeric,
    median_income_2020 numeric
);
    DROP TABLE public.carbon;
       public         heap    postgres    false            �            1259    17734    nitrogen    TABLE     �   CREATE TABLE public.nitrogen (
    city_index integer NOT NULL,
    city character varying(100) NOT NULL,
    nitrogen_month character varying(30) NOT NULL,
    nitrogen_max numeric,
    median_income_2020 numeric
);
    DROP TABLE public.nitrogen;
       public         heap    postgres    false            �            1259    17726    ozone    TABLE     �   CREATE TABLE public.ozone (
    city_index integer NOT NULL,
    city character varying(100) NOT NULL,
    ozone_month character varying(30) NOT NULL,
    ozone_max numeric,
    median_income_2020 numeric
);
    DROP TABLE public.ozone;
       public         heap    postgres    false            �            1259    17748    pm10    TABLE     �   CREATE TABLE public.pm10 (
    city_index integer NOT NULL,
    city character varying(100) NOT NULL,
    pm10_month character varying(30) NOT NULL,
    pm10_max numeric,
    median_income_2020 numeric
);
    DROP TABLE public.pm10;
       public         heap    postgres    false            �            1259    17719    pm25    TABLE     �   CREATE TABLE public.pm25 (
    city_index integer NOT NULL,
    city character varying(100) NOT NULL,
    pm25_month character varying(30) NOT NULL,
    pm25_max numeric,
    median_income_2020 numeric
);
    DROP TABLE public.pm25;
       public         heap    postgres    false                      0    17741    carbon 
   TABLE DATA           `   COPY public.carbon (city_index, city, carbon_month, carbon_max, median_income_2020) FROM stdin;
    public          postgres    false    218   n                 0    17734    nitrogen 
   TABLE DATA           f   COPY public.nitrogen (city_index, city, nitrogen_month, nitrogen_max, median_income_2020) FROM stdin;
    public          postgres    false    217   �                 0    17726    ozone 
   TABLE DATA           ]   COPY public.ozone (city_index, city, ozone_month, ozone_max, median_income_2020) FROM stdin;
    public          postgres    false    216   �                 0    17748    pm10 
   TABLE DATA           Z   COPY public.pm10 (city_index, city, pm10_month, pm10_max, median_income_2020) FROM stdin;
    public          postgres    false    219   ?'                 0    17719    pm25 
   TABLE DATA           Z   COPY public.pm25 (city_index, city, pm25_month, pm25_max, median_income_2020) FROM stdin;
    public          postgres    false    215   (*       �           2606    17747    carbon carbon_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.carbon
    ADD CONSTRAINT carbon_pkey PRIMARY KEY (city, city_index, carbon_month);
 <   ALTER TABLE ONLY public.carbon DROP CONSTRAINT carbon_pkey;
       public            postgres    false    218    218    218            �           2606    17740    nitrogen nitrogen_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.nitrogen
    ADD CONSTRAINT nitrogen_pkey PRIMARY KEY (city, city_index, nitrogen_month);
 @   ALTER TABLE ONLY public.nitrogen DROP CONSTRAINT nitrogen_pkey;
       public            postgres    false    217    217    217            �           2606    17732    ozone ozone_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.ozone
    ADD CONSTRAINT ozone_pkey PRIMARY KEY (city, city_index, ozone_month);
 :   ALTER TABLE ONLY public.ozone DROP CONSTRAINT ozone_pkey;
       public            postgres    false    216    216    216            �           2606    17754    pm10 pm10_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.pm10
    ADD CONSTRAINT pm10_pkey PRIMARY KEY (city, city_index, pm10_month);
 8   ALTER TABLE ONLY public.pm10 DROP CONSTRAINT pm10_pkey;
       public            postgres    false    219    219    219            �           2606    17725    pm25 pm25_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.pm25
    ADD CONSTRAINT pm25_pkey PRIMARY KEY (city, city_index, pm25_month);
 8   ALTER TABLE ONLY public.pm25 DROP CONSTRAINT pm25_pkey;
       public            postgres    false    215    215    215               }  x�u�ˎ�6�u�W��d�6�E�� Ye#�;��F����C����l�����*����zY|�������{��\���=yk�gk���"F�HN�#�$1�X*H4�l>�HcIF��TC �����ʤ�J�����j��l�hm��;�C���F��U�Y�ۏ�\~[�/�m��Z}�;
��D�HmI�(�=gB +((
�m�g[�dT����=4b-����T�j� �!,�=�eG����8B( �(�����rG�z�uT�5�(��cƆ2�u�$!S�؈5Wk�����fi?f}���Xq���x3XI)��1#f�r��~�+�$�x(�V�{XAb��89_>ޮ��r[ﴸ{���������C}]>� mhQˌ`c�~�cgqM�[��Ç�Eh�	
CJ�^��;lm�a�EvV��<���a�/�8�a�]�ܐKoz�l�|�~�w]������?KH��1ɽ&v�F��7��(Q�Z�$�(ic$$#�Y��J2L��>�ի0�#��i�B�Q��8d%rX����,=2�97ؓf3���fw�c�����r����Ҥu��">����Ҧ��iP&�s�X��a�H����u�%�&Jќi������K�h���pf_'F�B��0a���.s���ϒ3;牊DK���_��+m�)�>$.��x.̦��&C*Bٱ�$�:������"C`�:���Ue��XaG=:I5
nr��ɪ3�\�U=uf�U)�V$C�+��:�x\>�h��)K�eW�.`��AeR8�����J*�T5R�gh!�j�q�"�W�lEV�:(!e\�U8��[�u����/;]-��I������z��G��Ek��������r���Rz8�5f�$�W�)�3�:Or���=Ą�x��"SH���C�vrC.�M5�!����\�������~_��kjM�h�����^����١��<���ѫ�&��S6N.���M/��;+�����.�û�ae��L9I�cF<��<EpH�e$��~
���s�ݮ���9�����"o/������K�`;f��!�UB��% �l��'㠋��N�gR
_�W ��CS`��`� �v�w��b�秧����E1         �  x�]�Ɏ7���O�'(K���l � H�)��LpҞ6f�y�����}3���sY�����t}>���=�S�R���iP���͎l�iK8  �T	@ 4�(�c{1{�&��- *�eY���C�>O{ؠ����CMC���d܀ �"�pB�H[�[@U��#�L�:���d�����E2�~��������z�E:k��R�H�en5è�aG&>�B�nڕ�ʠ���c��ƴ����S�ތ遑@[g?)3#�ض��&��/g4$��� G�,,���6M}��u��e���{A9�z�~����z�%���8���uke�Eeڍ���V���~kgk�H�e��Vҕ�0��X&r��5����U+�,R�Mz"D���^GU��,�G��E*�Fn[�W�z�������	�}�G�t��،�<Bt_C�ٷ�Nd8��զ��$�$C�%i�`"�"r�4�O�`�fRuqh�XU�b�Q,��{2�F������zΪ'g��VBr�������vy�q�l�����C�s�*v���!�H�mXa�{�r��Xr5� R�(��$FJ}9�W��P%RS��=�h�Bt�������[ļ>���"~�P�u�E|=W����ӧ�����_�g9ܶ*>�Z�3�\������C�y���s�rE�'�J��
�1�ъUŀK�bu��n�(�V��s��F�i_1}gayG�u�Ֆ�_�vt��+�|�v�Cx���p���������׷��y�mE��\ǹ����߆�r$�:M��$�aaE�� vWr]�@q lC�^�~�)�˥�#ۗ�}{:�Y3wv�#d�A�{�ՎN)���C��&`�Y �'?�߮a�1S��㥙��N���W�*��vǤ�b�H��^��O�;��u��	��p�����#�ٟ�<��m3�3ժ��IA�u���)�qot��	"�~{w>��1Adt�˃"k����v�)��*`m����( Lڡ���XqM��)�!��290U��/�l#M7_�u��2%0>� @�fE��G�J-�\)O�RQek<�އ�"�|�\o���G��Qژ�X(ݯk

�ӂ�\�Ry���f���\hӻP)f5P�D¦�"3�@!{]w
�Y,u~�j����ԋ��=����P�z�i�j�rM4�(���T�2�A���I:$�0b>���J��w$G)
�5!Zg���sk���U�K�z�lh��Р�b_�����AH�����Q�	Sh
~�|y�q�~��K�2t�|�'�2��>�
Q"��k�}6(
Q�$T�Yk���m�%4�E�4�P�2��r\{�D�F���e8ch����2�
����?�PjQ:�c�'���:��W�����v����2#�Q�4�d�b� ����X��flf�2��y7�#�k�Ft]��1�Q%BWω�H��j��g�G�(ΨI>^*����R��He\�0I�슸�`�w�rF������$u�         >  x�u�Ɏ]5���>E� �<���P@ �bs�tPC�/���=���|ۮ��:.���7�������J�2�^*�Lv��UW=�ZM��d0���y��Z�L�x�� �����(;�,�3:{�vR���e/��=M��ݧ4�y���'�H�&���1- ��0����������	퍹�ds�j~d� �
�M�zA<K�J<��]_�H���UӁ$ ��/���*mg�_�I���$�'ʋ,���$�E":Ua0���������Xh墹/���&袄 a�DM�8	�B�yigń�B����\�*]WV -����nZ# K��D + 3�
)�T��^SY�)&��B�|{|��ػB��t�t�����K�qu M ��ZUv �-��U\'�Z�
����uBOb�#�*� ����î=�!F�n��)��X���,%SJ�-��L���Eɻ���󻿞~�����%k���eZ�����ˬig��՟��Vw�:Z���i�ʫ�9�D�M��čQ�%6��ٺi&�7�A]���������aW��[)#�˩����1�	@+A]h�b0��@Ɓ�!8�v�:��-ԓ\�UkkY���b��k�Lq?�')2�q�CqS�jE���7������Ie\�F(��Z���M9W��`84�� �5��D:��0�x(Z�%��`xh���LR`����8M��ڄ�ٔ����Qi�N'wy{�yЗ܇ ��5�ne,M�e�5+�#Z3�aV���*�9u3*�Վ2��[� }��֬���j���V$E\neӭ��seۭ�7���<���׿��g~I���㏇�q�S�����^s\�6�UQ:�&�D(k O�m�5@+5	m$�����T3	H�kM	a'����n+�&��@�L+�T�:znc��D��t����Ëo�?��p�&8[��s��[q�\�6M�7���!c춞�9�l��&gw����s;��a1��غ���r����	�D8m�2w
#m�)[��6�򷟏���������o��܎$ct(��r�:�X2����D�c���BSm�Н@���&����x.N$������r/���t�9B�{���Pڱ<@{2��ǎ	~��F����y`|
5�%wu�,��]ѷ"�[6�=�Ó�;4��n�QL\�g�[<�����Q&/&1s�S�AҎF2}�\��Aiĭ��������׻��ǻ�-��/q
���`2S�|�0L�f�i���a|���+L���*�`�s.*a4v�T
� �b�a,bS�e���Y�2o��������{؝n	�Q�W��Q�CA�D
A��	ʄ�6�((BHګ�4!Nh�d�@���6���Tj��r���̯�J��@��n��Mh���k�7��?����v���P�V�DT ��m	��4 >E�v#��������~,����~�m�A���G� � ��	&!r��)mz�����J�*wƟ��ϟo޶m��9�^Z.��p;��5������3 K(j��9B�nje
�	�y�!W�@�2�V��F1/KW�T�(l��˄8N�;b��9/���6�Ms��m7�A��/�����������(�O"�ֹ>��4��A����x0�L)#aΆ�w��D0|s�?	��5Ê2����ʘr]�h��15��Fm���ju�o/S>�	U���vL�K�ѫb�ӌRm�a-�_=J� N`;9��$M�1�#D�g�Zw��j���z|]��m&��^�o����i���Hу%&c����^���d��         �  x�m��n1E��_�L\��	!�U6�!�H�J�O�]U�v�KtN�q��[>^����K��vǓsK�.���	 L�μ�(��A_F�^�_&��v�ܡP�NK�2���V���
!8�UfM�Q�\�F&^>?l��/����<��/�"Ѻ������5Z�]�*�a�=e
l#���Q��ǠBA!h�dۨ(�>�a���G�E2� �c_Yj1^V��1K��)��v��Y�*�bC��'(5�c�A�!=Pm(Y���k(c��$����!���=*L�ж��$;2�7����ӇO������|��;Rۧ�TW�g�� �Uf��CЭ:Y�S�`7Y�G%�$�ڣ�󪆖Q�O�v~D)LR��U��$��1�0���$�ԓx�Z�_�/V�Ը��9	��8����u��9 ���I�ܹԨr߹V�؀4L���uB��>iB�6nE��C�ZM�Bj~��/�'!�OyM���� xlb��w���p�D� h�AH ���\� /���2�
<�i<c���,|�Yx����k{���~,�֐�=
v	T0�`8���1���(X2
�o�=�8EE����Pܰ���� 4�meH3�3ǘ��U�����ۿ���.����5�^_q�=��x	�D� d�G( H|k(*iZ`u8?���C ��5�3� y���S��;���5�`         =  x�e�ێ�4���O�O��]>^�B�Z$����4�@ӽ��x{��J�}_�N�b�[>=�O���~��[�[[XZr9��]<x�܇���/0��k��,�n�a$�~M�j��ԕ�a��_��nҖ�ѦTnkHL�S�;
qM���I����������_}֭T��X��0﫴�$�(X�vaM8	��Zc �B9u���@�P�r�+W�i��l���x���U���^�,�y݀`j��S��J6�������������U����)9��5YCґG�������3�b�F�
�AC;��B3�_(9C�s�4y�_R��G�����d�G6�\V����"*>�.���O۷M�T�Z}�*�ĥ�eX'�%��c�&��$?�o��&���ע�(U���$;B u=��C�t1N���i��x�`$�@��`$���P������m��4Kc���+]b��)��5qr�����"{�2tz�4�X��˾��	�����3�h �	4��c�A���-�t���/IBM��ċ�1����Ϸ�����w��r�9��.���9U�AA�Fk�ACz��H�8�:设� %YE:4�Û�l��X�Q���rMEO�����M�CL�?~�B*��t%,_���<�>���g���!G�K����^�ģc�W�IG�lG��G�؎�Xc��S���1�R;�WK,���Ru'I�{d�%�$}�z�5�_ƫ�S���?>��������������@�i?��s��t���F��ORBC9]��$ٓ�dH3�v28e��Dd���$9�� ,���2I�KdZ�l�Yvt[t�t��/1K�p�G���n@�0��oz�!�G�_Z16�'l�<��!��)7�{�T���^�Wn�3��������B�Q��Y�,$�p���$��M3�#��g?o_o��2�3ʥ�
�����;�Q���U����"#H����d����G(��q{���� ���?�Q��Ro��� ��j��s��a����v��\�i-��os�7GV�A����T:(H�~we%ZEN]n�k���!_�}4���!��҈�(�*z��j���:�z�X�q��>5�S�=�ׯ������藖�Z�����^O���J<(�O.�c򊒭b�फ�����cŨ��wН6k$�0�Y�#�F]��~2I8�u��C81=�oE�����n�?L����Jr�'�ͼ�Ax�S�� 4PoC�X��g[pFՓY��N��ց��˒��z�,������M��G�FN�)�n�����[/��fze�     