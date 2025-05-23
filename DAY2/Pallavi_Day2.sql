PGDMP  3    *                }           SQLBootcamp    17rc1    17rc1 2    -           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            .           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            /           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            0           1262    16714    SQLBootcamp    DATABASE     �   CREATE DATABASE "SQLBootcamp" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "SQLBootcamp";
                     postgres    false            �            1259    16723 
   categories    TABLE     �   CREATE TABLE public.categories (
    "categoryID" integer NOT NULL,
    "categoryName" character varying(50) NOT NULL,
    description text
);
    DROP TABLE public.categories;
       public         heap r       postgres    false            �            1259    16722    categories_categoryID_seq    SEQUENCE     �   CREATE SEQUENCE public."categories_categoryID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."categories_categoryID_seq";
       public               postgres    false    220            1           0    0    categories_categoryID_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."categories_categoryID_seq" OWNED BY public.categories."categoryID";
          public               postgres    false    219            �            1259    16742 	   customers    TABLE       CREATE TABLE public.customers (
    "customerID" character(5) NOT NULL,
    "companyName" character varying NOT NULL,
    "contactName" character varying,
    "contactTitle" character varying,
    city character varying(50),
    country character varying(50)
);
    DROP TABLE public.customers;
       public         heap r       postgres    false            �            1259    16750 	   employees    TABLE       CREATE TABLE public.employees (
    "employeeID" integer NOT NULL,
    "employeeName" character varying,
    title character varying,
    city character varying(50),
    country character varying(50),
    "reportsTo" integer,
    linkedin_profile text NOT NULL
);
    DROP TABLE public.employees;
       public         heap r       postgres    false            �            1259    16749    employees_employeeID_seq    SEQUENCE     �   CREATE SEQUENCE public."employees_employeeID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."employees_employeeID_seq";
       public               postgres    false    225            2           0    0    employees_employeeID_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."employees_employeeID_seq" OWNED BY public.employees."employeeID";
          public               postgres    false    224            �            1259    16770    order_details    TABLE     �   CREATE TABLE public.order_details (
    "orderID" integer NOT NULL,
    "productID" integer NOT NULL,
    unitprice numeric(10,2),
    quantity integer,
    discount numeric(4,2)
);
 !   DROP TABLE public.order_details;
       public         heap r       postgres    false            �            1259    16758    orderid    SEQUENCE     t   CREATE SEQUENCE public.orderid
    START WITH 10248
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.orderid;
       public               postgres    false            �            1259    16759    orders    TABLE       CREATE TABLE public.orders (
    "orderID" integer DEFAULT nextval('public.orderid'::regclass) NOT NULL,
    "customerID" character(5),
    "employeeID" integer,
    orderdate date,
    requireddate date,
    shippeddate date,
    "shipperID" integer,
    freight numeric(10,2)
);
    DROP TABLE public.orders;
       public         heap r       postgres    false    226            �            1259    16734    products    TABLE     �   CREATE TABLE public.products (
    "productID" integer NOT NULL,
    "productName" text,
    "quantityPerUnit" text,
    "unitPrice" numeric(10,2),
    discontinued boolean,
    "categoryID" integer
);
    DROP TABLE public.products;
       public         heap r       postgres    false            �            1259    16733    products_productID_seq    SEQUENCE     �   CREATE SEQUENCE public."products_productID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."products_productID_seq";
       public               postgres    false    222            3           0    0    products_productID_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."products_productID_seq" OWNED BY public.products."productID";
          public               postgres    false    221            �            1259    16716    shippers    TABLE     d   CREATE TABLE public.shippers (
    "shipperID" integer NOT NULL,
    "companyName" text NOT NULL
);
    DROP TABLE public.shippers;
       public         heap r       postgres    false            �            1259    16715    shippers_shipperid_seq    SEQUENCE     �   CREATE SEQUENCE public.shippers_shipperid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.shippers_shipperid_seq;
       public               postgres    false    218            4           0    0    shippers_shipperid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.shippers_shipperid_seq OWNED BY public.shippers."shipperID";
          public               postgres    false    217            t           2604    16726    categories categoryID    DEFAULT     �   ALTER TABLE ONLY public.categories ALTER COLUMN "categoryID" SET DEFAULT nextval('public."categories_categoryID_seq"'::regclass);
 F   ALTER TABLE public.categories ALTER COLUMN "categoryID" DROP DEFAULT;
       public               postgres    false    219    220    220            v           2604    16753    employees employeeID    DEFAULT     �   ALTER TABLE ONLY public.employees ALTER COLUMN "employeeID" SET DEFAULT nextval('public."employees_employeeID_seq"'::regclass);
 E   ALTER TABLE public.employees ALTER COLUMN "employeeID" DROP DEFAULT;
       public               postgres    false    224    225    225            u           2604    16737    products productID    DEFAULT     |   ALTER TABLE ONLY public.products ALTER COLUMN "productID" SET DEFAULT nextval('public."products_productID_seq"'::regclass);
 C   ALTER TABLE public.products ALTER COLUMN "productID" DROP DEFAULT;
       public               postgres    false    222    221    222            s           2604    16719    shippers shipperID    DEFAULT     z   ALTER TABLE ONLY public.shippers ALTER COLUMN "shipperID" SET DEFAULT nextval('public.shippers_shipperid_seq'::regclass);
 C   ALTER TABLE public.shippers ALTER COLUMN "shipperID" DROP DEFAULT;
       public               postgres    false    217    218    218            "          0    16723 
   categories 
   TABLE DATA           O   COPY public.categories ("categoryID", "categoryName", description) FROM stdin;
    public               postgres    false    220   m<       %          0    16742 	   customers 
   TABLE DATA           n   COPY public.customers ("customerID", "companyName", "contactName", "contactTitle", city, country) FROM stdin;
    public               postgres    false    223   n=       '          0    16750 	   employees 
   TABLE DATA           v   COPY public.employees ("employeeID", "employeeName", title, city, country, "reportsTo", linkedin_profile) FROM stdin;
    public               postgres    false    225   J       *          0    16770    order_details 
   TABLE DATA           ^   COPY public.order_details ("orderID", "productID", unitprice, quantity, discount) FROM stdin;
    public               postgres    false    228   K       )          0    16759    orders 
   TABLE DATA           �   COPY public.orders ("orderID", "customerID", "employeeID", orderdate, requireddate, shippeddate, "shipperID", freight) FROM stdin;
    public               postgres    false    227   �s       $          0    16734    products 
   TABLE DATA           z   COPY public.products ("productID", "productName", "quantityPerUnit", "unitPrice", discontinued, "categoryID") FROM stdin;
    public               postgres    false    222   �                  0    16716    shippers 
   TABLE DATA           >   COPY public.shippers ("shipperID", "companyName") FROM stdin;
    public               postgres    false    218   !�       5           0    0    categories_categoryID_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."categories_categoryID_seq"', 1, false);
          public               postgres    false    219            6           0    0    employees_employeeID_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."employees_employeeID_seq"', 1, false);
          public               postgres    false    224            7           0    0    orderid    SEQUENCE SET     :   SELECT pg_catalog.setval('public.orderid', 10248, false);
          public               postgres    false    226            8           0    0    products_productID_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."products_productID_seq"', 1, false);
          public               postgres    false    221            9           0    0    shippers_shipperid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.shippers_shipperid_seq', 1, false);
          public               postgres    false    217            {           2606    16730    categories categories_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY ("categoryID");
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public                 postgres    false    220                       2606    16811    customers customers_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY ("customerID");
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public                 postgres    false    223            �           2606    16757    employees employees_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY ("employeeID");
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public                 postgres    false    225            �           2606    16774     order_details order_details_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY ("orderID", "productID");
 J   ALTER TABLE ONLY public.order_details DROP CONSTRAINT order_details_pkey;
       public                 postgres    false    228    228            �           2606    16764    orders orders_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY ("orderID");
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public                 postgres    false    227            }           2606    16741    products products_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY ("productID");
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public                 postgres    false    222            y           2606    16721    shippers shippers_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.shippers
    ADD CONSTRAINT shippers_pkey PRIMARY KEY ("shipperID");
 @   ALTER TABLE ONLY public.shippers DROP CONSTRAINT shippers_pkey;
       public                 postgres    false    218            �           2606    16828    employees unique_profile 
   CONSTRAINT     _   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT unique_profile UNIQUE (linkedin_profile);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT unique_profile;
       public                 postgres    false    225            �           2606    16805    products fk_catid    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_catid FOREIGN KEY ("categoryID") REFERENCES public.categories("categoryID");
 ;   ALTER TABLE ONLY public.products DROP CONSTRAINT fk_catid;
       public               postgres    false    220    222    4731            �           2606    16812    orders fk_custid    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_custid FOREIGN KEY ("customerID") REFERENCES public.customers("customerID");
 :   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_custid;
       public               postgres    false    223    4735    227            �           2606    16790    orders fk_empid    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_empid FOREIGN KEY ("employeeID") REFERENCES public.employees("employeeID");
 9   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_empid;
       public               postgres    false    227    4737    225            �           2606    16795    orders fk_shipid    FK CONSTRAINT        ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_shipid FOREIGN KEY ("shipperID") REFERENCES public.shippers("shipperID");
 :   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_shipid;
       public               postgres    false    218    227    4729            �           2606    16775 (   order_details order_details_orderID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT "order_details_orderID_fkey" FOREIGN KEY ("orderID") REFERENCES public.orders("orderID");
 T   ALTER TABLE ONLY public.order_details DROP CONSTRAINT "order_details_orderID_fkey";
       public               postgres    false    4741    227    228            �           2606    16780 *   order_details order_details_productID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT "order_details_productID_fkey" FOREIGN KEY ("productID") REFERENCES public.products("productID");
 V   ALTER TABLE ONLY public.order_details DROP CONSTRAINT "order_details_productID_fkey";
       public               postgres    false    228    222    4733            "   �   x�5O�n�0����ԩ(��9�:0��-�!�d�r��}i9]xy�;>�=�`:B̡���|�G�K��6�uX�rp4A��t%�tA�z�Զ��),~�eLINk'3��]AT�䔏b_V�_S�bz���j���~���}5=%���ū{wҜ��|1�,��uP�$f7�L���I*m�����U=�2U���1#����~��	����KڞA�����4P,%��aC�G���<Yk� ��y�      %   �  x��X˒�H]'_��񪪿A2�T��I�,�Fdҙ��!�iO�Wы�����\�*S�^����s�=7��?
�W>Y�;ޯ�Jڕr�dca���Υu,�t<�+�ԕ��V�����l �Z�}Ǜx��yZ�?��4<Xo��8��,�?a�NK�����U�?�s�x��VF+���Jm�L�RK�|���3I<�1ϚZ�*$�٬0k��P�|;����h6u�A2H)�e	�;-�U�����E��9�b�|q/_+�����eQ]���,��\�N7��0W
�S)yO�j%*��p6��Ƽ��1�/�Z_�ލ����ty�J�i~��ˊ?�ұ�m���W��8J��g��J��%�=�D�R����K�:��n�=�m~+U����ʑ18��
�IF���Y�a�T�[��t#B�'|3�����D�Ze�Gr�
�/G�����>y6�XU��]ϔ����cA�b!��GJg����2��E03'v�M��Or�����u�9j+-~�؃�P��+v�Vŏp�{�l�YU�k>�߷²���ʀ�T�7���%��n�⍂q��>p:~0����;kxf��L� �*y�����H��F�n�����4�;W�=�*���X��d�z�^�Tu@+�w�x<�b(�1�)k�T���{2ڙsX��
�H��SQ���VT	+�t+�1�����2���صf���^��=ֳ"+�^�u��]ҭ�<��R�����ڃ�n��� �^���/���4�q�H,l��)7��3&/E�f���Zf�����pi���� ��rX�*�Z��P��X����� �̫���7=�kUN�/�Z�27����><�ꁨ�����i
;���Re�����s<=+TV ��w�zJ.O��X/����>J����5�w�Jg��5_��/�"A��F1YZq������ ���K'���K��g.�'�d�ZYI��v� XEd���~i��/@AV��/0��S�-�I�kUU7l�	J�o
�|n(�Sa0	)�H�m���C�aa%Jx3O�.��|Wd�,D�%�+��^ }���j,kyx��H�����R���=6�ohrr��/d����ڰ �1�ZBl���F�]a3�#N�Ľ8eCs��@o�m�+�޸�+?�E�ʽ���K���Z�',=�Xe�hI9�����}����פ���ug����!+�Y�}c���`C�C�<���8q^�@�d�ԃ�8M�Q��%'<�V�ɛJR'H#��	������@�����өi�r��|B�|{
jF���5	�ɝ�@٠`�D懠����mX�LE
�������d�a�����M%y�� /<ibN G0C����\B�Q��Z|��J���D-����H>�&#�M6�Zߨ��+Z��0��]˒3�$�e	��ⴼى��!� �QL6j~�jY��x�N�i� �����7��δy~�@�`,��<'`ujt��� fP����~ 6"���C䍽�쭅���甤��@�2�z�,3|hj'�6�.	�eA���j�Xʗ��ܩx3�k���� k�޶�mR�}�0��Þ���Љb���y��H�>���k�(�S�)Ԯm����DjdS�9��Z�~��Cq?��V"��d����O>�)��6��?K��؍���d:z���a�ޥ�!�����h`���g��ѕ�=�\��T�Y�D�$�1z�#5���:��:�3�zr)���F&���J<�O�)i�������i��ҖW)y������p�@c��������(�'Q�V�:e��>0[�Dݢxl0b}B@j�ïZ���N�/lO�8<�!nm�Y�X�J�B����UdJ} ��d[鴢onBs��N���`��I3��@:�Z+�*l��3�.��_P��b$�栮�=��Y�&��JMM�_A�̎b���j.�o�b���U%��"�U��g�$��5 &������c��2�����'�,������=��дP�����jE٨��h禽Rj�Z��>��Ю�Gx�)˫�bҤ�k��6�W�FT�|=N0I�nE\y:���LN� 	}�/P=yz^�2$�)���Ѯ�~0�n�4���c6U�R�)��ײ�`� Zgs��Eh Ζ��rz����M��L:(`�=��J���w�T���yc1y%�~����\�[|��jw�VOuq ���Ƃ	��a�����47AV[(A��������������b���n�[����� B����c|�G7��߃�R��[�{�7���jh4Ĥ�躣F�3�@�������墦� �kq��D.�
��*(�҅	x8^�˨�vv{��h�:q@�� �TE/�O��ފʅ�@�$�n/6�K��l����F6����~�Z��n~%�l?O�q�$���{^���,�	_[ʚV��n�7�hX���I}c�CO�WYu�D�s����0wb�����[y'�JS]�f�����M�k�;�,����=�x�Q�:�f�Q���^k.,���{$m��m�����h���>2�.�j֓��I���C�1�O��g��.�@bV��^0^:���`�*�<��o��(T�_k�;���xڹuL�|���zc������1 I8;l��+D���m�_@� �2|gà�Y�VK���~"u����Z�_�	����4�2�m˻�3��Q/.��ԥ{���x�N![�Pjy8��K���h���M��X�i�_8h�1=�ݘ�����h�Ş����a�Vv<K�ސ�{D��_��U��� ~�������;��ٰ5��w�����H|j���r���B�O�r���]]R������ӓ,?��ДSHkh�E{��?�?,����?�[���wpt��lEɆ�Gǖ�t[>c�!�3�GK!QfƔ�����Z�נ)���9� ).���Mz#�L��F��.�Fu��6�x#���\]p��%�![��i�]�j� �g���L�7/�˚��n���|�I��e��s�@ T~�=hm����	9��s��!��c��6~	9}���K��-�ԙ=e;���>��x�0����Z@���Vf���~��b��Sf/��G�=�H+��G�Ir�q�w��B�؃Ě�S���r�bG��5���N����&�      '   �   x����j�0���S�	M�6=v+;�I(
C�Eb���qR��3c0��Cn:����h5Yy[��2܋_<�l=2�|oΟ��l���!ɝ3���3�X����`{xՒ�>�ZE����S�(2��Y�䑽Ѷ�c��ȷ�f�$�<O�,0�&�V<�#K��QŹ��Jg��p�A��9.��a#��F����_>O�%���>���[���J<�'2��?���i���}��֩��|��^��� ��       *      x�m�k�m�
��Әߏ�T��Q�1p��䦾x\NE@@�w!���?������s�����S���6�cZ�/&��������_g����/�_By���տj:TG���K��2�A��BظH��:��0fc��G�_�_e~�^�8�_�����4Կ`�%��;7[[,S2�<0��*Қ;I��~QG�?1��u�_�qM�6У�����C����_�s�8�����i�A�N�o�;i�3�Z�˓��1������	)L�5n�1Y��Set%3�c��.�3'�E���������8��*J�q�2�눵��󠫲��aЪ:c���7�3:���f6m�X��h�r�QD�иq�ߗﶍ�xE���+Br4虹 ���6V����y���p���$F��*d�Q��_!���'��=���ʐ�����2U��ʲ�A�n�e0����a�7�ƴ.E�y�?XI���PHE�qPQ>,$༱vBzP���>t����9�J�P?^��j�g|4C�am+��n���)$�� /+4���1�v�݉}Q�%K�Zyoq�:�����15Xc*�Mfa�a'}���>�m
���))�,�1�C��"�O�����F����Z��E��t
>ChL��2X% �&����!+6�v�;��I�>ƈ�W��Ҝc5bv�L�w���D��U(��3pL{|��Ne8P֬�!uòKS���t���c#��I[S��'�X_�;�4�A�3c�C,�9�N�n���%L�Ս���xxQ+����0X�4�}����)�IE�W�٫�Ui[Y���a��{�~��8�N�c<�Mh�0�qr�/��0<�d�Z��m����)�.��C���Q4�����8q�x��y�Yo0��˘�Ih���8^j��'�hqc{�q�6�LdW�������ظ�4��
t=�"{�o��t:�Y/m�HV��,P�c*䫋]ġ�d���u9-mEj�zU���'��v}�'�c��W���UP���c3Xg��<�Q<���I":�z�!8�)F�$�Ҫ�������3�=�ծ+�J�?��L`�:�4��<5�:�<�N�(z�R@سa�2�w	c �'3��.1��4A�pV���qE�qxȤ6�iw�p��	��g9�	��A�)�F4��M��"�R)��EE�B�5�j#q��
-��V�7&CFؠ��S��b� � �:�f�0���S�p5X8�D��ɦ�o�Äg`��84��	���U�y�����i�Зˑ�c%�P�W�}�29;v�הFĤ*AbGr ��� b�4N�nm���=�O�;0B`��F�ȉ��Z���w��SkB�$ҁ�40�9��LT�X�v0�ئD������BK�l�M:��B�l�̃���8�CZ"���0�x�wv�3����	��E�t�ͺ뛡���O��F\�����R��S��V�A� Q�+qc>k�g���?	��.!��󧇱�ެD�թö��dc�����TX+7F�����P5�h�S�4��H"�:<� ���0�i?n5M�T4y�P	��'�-Q�#���t�#鐎O��Y&eEu`=�BJ��L^���V�-����X������+/��f�P쁶�lV]0o��0e��0@]I]��� 3$��E�5D�P���MS�����C�W���Sa����!}x���8
vRf�������z��M�)֞q����h�9��k� R'��4G�Z5��|��P"��5�X3g�+�?;ƌ��K��!��W��Û�^"�؆�_��"M6��R8�΁�^��}�M�qS�e	��'���MǸa����<���g_6�م�.�~Tcl�֊u	
��A�y:b6d�b`�>Wg�Ȫ��f�=?G�G��WUj�3��͐��Vc��$#��+>��N+6W������٘ī0E�,0V��>����5�{�#0t2h�N�1yf��t�/	힍U �+���x@�܇M��ƈƓ����DL"��Н7UAj�S��z|Rm��!m���uB_�Ş���w�TMu������7(T��:��[�z���,��p��7v�h���GҟQ��1�l��eT�$G>'92t"��N�_JV���jZ?*i?�;IH~/��j
�/�Bh�Ӝ��!���2�+*XOn�b���^�4����##�N�1��X]��T�xԖ`�,���І�5*lq���/u/�xPԯ`��ީ�K�)48~�{[%���"��MbӀ�as��i4�m1�#w+>9�NW�;oz>�D�SeK`���H"˻_K���E&\ﳭr՛G!D��0V�A��(��)��7̦�2k(�E�錈j���9x�`��Z���1TK�����Iuƀ��8mm}���������$�*ʹ��(�}�8\t�XYj���a�rS�
�5���*h�v#��NŎ>��_M����z$�f���6��I��-6E`���3><Rr��[�#QZ]ڟ!���.9L�t��4�P�u'����2�[I�FJ�p���$#��h���1�j�aS��I��\	�E0�mI�Ɲ���k�G���T�b��*b6f�ɎBc7'J��.Tb��c�3��L$�������i�jei��ЄCQ�$.dq�!���j���Xes~��
���R���P�	�C�ǉ��L�qq�4���n��H'��(�H?3Q������S�B_�SvT�	���8`��QA�# �L�zc����*Z��Q�`3y״���0g��+�u��j��|Ő���i���Cf�8=��s���ӹ"S��є��G�����L�`efl�{we
V�_���Gz>����s�G�'@ogI�Cc��Z�u�)��i�N�5���9��� �����g�#��΁6�������T�x�[%?��L.�6V�����?��k��d�G� B��.7��"�$>7�d�����j#�J+��I�ej�j��q��R$�{x����� rLBm4f7FE;M���w`���B�K�R���Qii��b��4���@��|(�'������2Z����׫Sܽ�����#�Do�ۭ��M͓�N�W�R�*��"%��.�`����O�wb@��DW�@��X��ȹ�uţ���0�,���b��s���*3|ټVmt	M���w�v�×6������|�RwOQ��:�*�k�B.K��|�6��)%�)Xѩ��6F��UDw���(��X#x�o�����N�S
�&{S/w�z��/��ϊ��O׌g�A�s��N�y�c^����Yՙnz��W#~0���^EՅ���:+���0��9K�w���0*#�΅��k���<I�!S<�"������yG�[6�F��qxӇ�gm���#˩#uٷ�L�M�{<�T�m\�CH�����M6�$�	7��Vc^���ݘ����l���E)�� ���*K<X<�Z���9D��"z:�M��P9�Ύ��u	Ga( +�q�
"R-8�]Q��D�#���m~JX�\$���X6�g<��>�g;9����_�j �Ǭ�s���A�c*�`����݉NTK�Eİ޽���|��y�/+=j��ʩ{]�5P��\�%T��BUe��Ҕ���\�E�٠����a;�ƺ(�qkH��ݼ"isj���(v��
d1=�F[m�2�k揖`��$tгM�=	��C�k�,�`U�H�d)��Q��?X��<�m/�4��lx)�?��(��v��*�O����~i��<�s�a�	��o��)��Ku�M�(6��--v�}�0����3���/H�U0h?��w����0|�d9:L3����*��r����9z�V,l$����+Z/!�a�t��1!����}��oQ��� �I��f��m�W�%�ݏ�=�Ar��w��B�Xܸ{o�����GE�zV4�hf\w*��Lc̵7��5d26��j��z躵CxI���C�g�w�3�]h!4�*�,�ɑA���."{��*sDf����V�0�S��vD0���+w�\ZH�$	�W�H� ��:��k�5I	�    .Qs�*�q:ޗ�0W���3]�&!�2�ю�\+�Djyc�����C�3\ׁ��B݊U�4}&M�%txO�8��Q«�i[x|P���B�M��^0X=��H}7��BS�x˒�3�=���:���ϰ��vB`v� ��#��P���/�)g��ޝx/��U��\��TW<�.��qy������C�YR��鱂̧��8���-Ճac�znC��8%g�pL^!7r�V�aY�H���[�无��-��p�ާi���yJ��$g�$�����x�)���⍞�%gu�R�p���`��x����C��^��8�P��f����1�&���R� �^Y��g�yM�	�Q�^�M V�O�^�|A�S���7�t�MP#�)I)�?[��&8�)�9L���֫��ƒ֊&�,T�
/L~�M�a�җO8�nQr�v����Sc�Jڗf�]VJ�:�􉝂u��� F���[� �ͩ&��IAL�x��k�m�q�ܡ�gbS4����r��[i�:EmLJ��)�Ͷd�[Q�FW���PyO�1��֊q�f"��(����;:ǄH�����A�x���զ9���-vgi�� �!E���(VV�m��B�G�xM:�d�{�ه6gϗ��Lb�����@
,h�h�<�r�DH��G�i���*�X�$���Oh�W���Ȧ���s���!\j��|WU���Uq�3W����q�s�uB[�r�V�n�_�`�,VuPֹ�4��AȣP�$ۙ޸�&J4M��s̿&N��8<>9���8�14�]B4P#���9-��y��.��5w�"��ِj�3����e�Z��p�?�NTl�h����g��D.Wb�sԘ���!g���	b��u�9dZ�d�C�-1,rd�f�E�`��r�t�8
�M�N(n��M��Q��s�$A�Z�3�b;Fn����Y���L|��
թ5�=X#��RX��0�CS?Nq%�ᚩz���X��950�eZ�L3���S1,��Jh�Q�q�/�;|w5p%::둹p(��S���m!dA�uޔ#v�@���"S�~�c�$��"��R���AX{�z������Y�N�b�F>��U���đ,af��D4�W�Q�L:�}=���ZbC���h�������2�:h��n/3ol��ưc4��� ���*�bw8�f[6����#,Yٙ�9�8�$���/Q�3ey�5%�H�hiЅ���X�Dt'1R'�@�~yx��ã����U
}d���@������Jsc�2�6P�#�;D��Ȝ�e�H��������'����Ω��)�sփ<	o.���C�hsqƂ'F�Z��%C��-��M���ȭQ�F������0�v�3c�hn��8��Y%ƪ�p׵,�����~1E�p��d�8+�}|d���]�M3u��^���	)�J^P|#�Z��r��� 92��k+�<��zae�$5�0��&>dnXJHvi�>S�a[�}��*�^40U�/�����W:�g�Z�jL�,���_���(���>���1}Ԝ�S�b�ֆ�"E�r'�?��&�F�J%���2|DhK���j5E 6*��m�� �H�0:�r��c�u˗JĖ}���QN�uMao��Z��bHź(���U�$�ߌhiH)��8���!��-�|�?�	�V�!�O�W9�������g[8��h�.�kO~��Scd��c(,W��+ ��aD�hJ��$�u{_X�Vb�*�Ru�N�Nka�n6'G����I�>u�:�\�(cf����q϶�U���T3�Ԗd�b���h��V���L�fT�¸��&��w�L�jWJf�?I�tl9Ul�!ǡ�[ �<0VI�j�
a�n�BOu��z �`��L3�2p�9��#�.�FS6��_����;�Zu�����$��q�U�ƅΞ��~J�J�k��1FЯa��2��ŎA��@�
�Bc���U�QJ�G>	^g@�jR���]oп�2��[ݍ�e[�D��Uy�5J�	���B�
�2��0�q"h݃�r�l�!>_!����TW�2��]W���u}�$E)�19w8�L��+��4|�U-L�,��N�
����
�"+�-��)A�M ��dx�`zD�p'���͌5ς-��S�\V��o�u�q���L=��=��+�)Uà���yc����n�2j��02���?�j5���5�W�R��gI#��]��%��A{a:$$�Q;E�$I���A��Ȟ`���ȳ�;�E_n��M��8������"<��Q�S%n�s��C�c{��k�����Lل��͚7�N��C4�X
r���ҔS旺�/D��(g�F�VĄ��7�)]�h�9��	��	��_f�#�I�LRڢ:Ū̻�{��6Ȥ�� �F�	�jN57���u�񣀠&�.E�$QС0}��j�b18���/��p��'3����+h/Y'ǭ�)o���BL)(���P�$���LJ �@�2_�x�>1�^��|oO��~�167�@��X5W��x�ɸU���j#:D�װ��#���z���W����>�O%U2��Ck j�t�P�`-x���7����fѕ� %ܩх���'�T���L?kc�T��gX�F����a�G[�=}o\Ig�Rj/1}�������
Cׂ�zr9
����qIn�o�C�f/�\��e���"��#�T�|:F�:%x7O��
H���R}b�4���^�).ՃR-3���Z5|���)�ȕ��J��oi������!���i�Q���Q��V���Usm� ��j�g:"���h	�[Z��
��^��5������P}cZ[��5F�h�$���cVl�u�V���5�nZ��]1��-Jb����%��lk[��D��ө�D�7�@��|�p�9�4<*#���)|�����%F�����p0'�7�J�B��I�@�u�k���˫>M0.]en'G�ND�e;�E�����V*/U��P�C�6�^w�CYY����Z��<���o΅ ��=)k�`�&���(9
�(3�7�7�P�[�qO��NW���ׅ��8s:�x����c�\��*^O_N�����=�v]���y�2V�f�H	�R��P-ymL�Z���e~���+�3�{��h_�	��y;��ҥ֔���5q�2���V�_�����jw��q���z]��.���|��g�F��������)�L����+���}�X�������*-�K���q����^h���Y�8=bVBu4_�yŨ���&_�$r���Ϩ+y:�ˍʬ2S���?��P}�����#BQ��QHu�(C�����R������]�|5C��Vy�
Ơ���q���cl�o����.Ih$��3Uy!�5�0l�%��y�c���!�Q3�'=�P��~Wb��W�����Å�}��K_�!��>
�ƨ�O���#�J=��|`��]_�p"	!H�庱���e��}6�q�k߷:V97���`ԍC�JbV�	�#5��R���8�?3F}V`�Z|Ӊ
�gZ�4�gj�=��'x�RE��֫ڤ�R}G���'S��ʌ5��	#��cnZ�"�Yg
%���C���(������-�PhT�b�0�M!���:T�M��Q��<�ʑ�Ʉ9���[����|}N0���>��������֖�GU|���'��r�.�m�?ev�7<N�>�-��Aq�$ś���Q�K�/\��I	��ld+|��t��I��e���Û,�2����>�����%^���-v�r$A/|Zĭ��;뤍I�`�Jѵ*�7�,�*�Y�xf,?�S��0w���?��{�J�A�2M���L�l ��w"��L�x0���K�� V��V�U$l�x-�-����V�+��*�"ѭ���RԤzɘ��
�bd���uUg	�`�[��t �y��"�`�?�y_j�Ȼ�Fw`~����m��Ɯ3����R6X��c�7�sb�7d��>Z��U�F�3��),�_F���R����i| ��[�1~Q]y�m��+X��s���n�4���-;p�b� �  w3�WX��G��u���\�pE	6�6�����{KM̑����Lu�*���f�qWf)�Ԩ �� �¤�X7i�����zA�׀�����4�sB���3u��0�m���G=u����Qw�9Ϸs���t�.��R��_��W�f��V���5�r=��A%{w͆!v�J@Ƨ��sz�w��g����z����c������e�?��åT�hxN[�x�5�G%C_�����P
��M"����M�P�0�H����x����>
ĻG<����P鞓�:���i��S_��]��<��ɋ��S��Cx��=D~������b拣��� F4��N���0}��_1:W�b<_�����'�j�>"�B?O�|�zh�����yc͐wC�q�� ��I7���Ơ�^Z�E��P�W�acx�e����_��Pٍ�A���ǻ1
�iU"o(?���qD���\cOQ���š�� ��c��u�F1"g�1l7tO���Pݬȟ����99;�M=\���%U;�����7+h ��Jf��<c\������q��;���˲���	ɯ"�Ώf�~K�KX�8@���K
]b�� tC5&��;�v��.$z/����O�'��"U5��~
�_��M��(�cр��(M������E�+�7�q�L0
�2ci�7ӭc���3]i��g��DsO�h�{��tr��l�Ο`S�\��u�e��u��^���ͫH�p��ُ.�Y���]$���}h�d'ke�H/�b7���46~p_G�`~Jz��	~�-��oa�����ɡ4��g6Ä��ㅔ�jd�����V��P$�@��c=�V����$�~��e5���u��zn�P�E��;v����`�ts�0}uQ^7�:?����%f���{m��`-umW�L��Kڇ�9�+�g!r���Z`��}4K��R0�gb�"M�`s��s	L�,���:���^�ށ�^n�2���d��5��kuiS5~�T�&�ʔ�!��7~ќ�.0k<���#�����Ǔ,����O�۳��DQo�3x��+3/��G�t�A�j�&
��h23փA����oK����$��N��-й&҉R�NŽ��C� �?_M�v�y*��.��Ϟ)F���Wm!��O�sZ�>�	&����{�P�?<�����9{�7j��R���c`���Iq�Ȍ1s�
�$jK�}����</���_�?�L���c�����2������s�nB
�cE�7{0�㡜�����'q�y��UEt�����|R<��0l*���ػ�e���
�_r�����n��&&E�`al=�8~�ڝj���}�I����c�͏k��~��|�(��a����O"{���������Y�S73�y~S����P�����>�W����뎍�q�O�������%K�7�F�fbhoPn�ž���~�B�
�Zg���J�%�E���ܡ_�{�����q�U�P
O]��%4K�����8�`�楗��H�%�uJ��4�&jVk(d��%��b��1Uw�3��@L���80=�N�Q�`�}�|c��V�o䗽
0����>�n��@����ڤ��5����'�d�E�2|~w�֞z���p�:l������L��(DM��W�Lk�а�y��7���I�w�����X�
�K�QA5p�#���N
���.�e���y6X��\����PSͺ)�~$���������\ҟ��[4�7��'mL��13�ޕ���Z�w��T��}PqF64߹쉿���?�^��[�g��{�
~2F�ں�M) c����_�θJB�"�Gjb��D.�{8����}��`���z_5lk�7���E��Ǉ$�D[~�)=4V+��U�I�K����X鷺�2}"���J��~��}�g��Fў�(�N�\�.k�f��!,���?A01N�Ժ?�O�N։�qu��L镥=��Z���W�����싢��B���	�8��q�QEJ�U�ڿ>����zZ�#��|�¥7�}�b��P����o�n����℃M\�w�=CM�	�"�{q�>�����;�����+�B㡚Tc�S��t����-������KU��,s4;�u�*?Si&�@���?L��0��߹�=�nӔo���߿���Cg�      )      x��]�v9�}����*��G'q'^��9�ӳf���w ɍRI�7��Iĝ��)���[�hw�_{���c����_]��������������ז,N�[u��6�.�uXܷoO?�޶�`e����h�-�K�sm��?���b-��������/8Z]0�d[�lg��Iz\��HI�`��2������w��sk��~���Ft�L�����￷j?`��7��M������_p������p�_��2o�^�?=mv�~���rq�*W�緟��6g~w�.��w�/Qpu�����3�v�-RQ_��P쨴o�/!jmp�6Z���2�m������C�o���e0�ޞ>��}���b�?�`^)R��*��x���.{b\��|���+�Z�Ǵ_�I�m)n������Ng~�p�"�̕�<�}|&�1n����x��[)o�=�D��"$-~i��'\.Q�+�׷��7 ��n1�ޙ+�Aʺ���Kہ��b.>�x_"2�68d@���5���Y*d������8�0P�K�.~��V�egJf�X���_�b�)�*���ɍIx�sP�lH=a��\߀��Ö����k;�@��P:R�T�cj�����"u}D�
����E������_ۉ��b��`��dme�������Ҫ��f�Z钘Irݾ?�a`~��na4TG�u4�f��t��ST(����x���Q�$@�)y�L�Bר��++~��D��f�u�@�tB�p)��%(A`�E��ܹ�ZrlJT���l��~�;L�f�>a��(�S���$w�����pTE�܈ڹ�e�e{{���3,��nÄ��o�%�(/u������ͮb����`�Ⱥo�_�x�9�sC�0X�d��P7�,tc�E����[����"�f��ʪ�3z"�*.ұ w�|\�J���3a b,�1�kT�Cf:�~���6I'�L��ע��K��$ݶ_1*�j��`���jR�������__q����8V�ajj[F�ʏ�=i�@4��V����h��T��O���%����~~Y��&�i�2;�K�uXY+seF������-���W��,G۷E[�Z��o�[�\���_��
ksk���ݶh4!�%��0���,-�h՘��l��U�x����[�*[��?�6�A׼E���K�m��[�Ek�`X6vۡa��7J}|{����k���G"ӣQ����?� ���Q���	kl�����|��	��'����"UPC�8C�E��������O�YĄ�����/W��ᘳΈ�����}�������mgd�p���������zj���E=�%rjv$3	��ZXY�r}m���l���9�3�w8Zwmϱm��&�p����,��]4�o������t�@Ru����xa��v����秭��LT��'Tj��ѮE�e-�>�H�O��_��$��tk�"P��/�[�#��Pl��][�u^F+۟��^>mf���m`3ѲX��� ��G��N�=߸�X� ��pp̋0rf�ol�����/���b���Oۏ�vlN���!������+Nvk�����e�����Upi��q��>�D�5�B����cA�������˖�ʡ�e��-�?��(��V��5�Wd�/����#�k�<�pU�Of��~ADr�$-��'�
�˩�l޶��B�_~�~B�����5/1��tE���v�1�q��RPZ9\'�\cJ�G �	��+�f˕��|�V����%���6eZ%*��P9�����81����<�xy�i�5^�8q,aCQ���j��cFw`H3��J��l��M�<�xzْY�@���ˠ&_E(Dg~7`|�ھ%������r�-�w�~Ӑ��~�����+,mr���0a���*8<k�q��F)2\ܞ�^l�f���]RY���+o�YńYQ�fy�|�bVi�\dw��$*_j,�q�3aGk;P/��rl\����;���9s��BKQ[!�ꆁ�����y��;�=]!�p�:�x	��D*�<n���_������߾�=}���\��ws����)l�O�ˤ���Ċ9|]�g'�r����h��7{;F�H���B��}}����R$���6�C�]�$���ӟ>o'ڗp����l�Fl�}A�N�택Ӑ'�|���1XT�6��HfoΙ�{p�I����{�
�����c,�?��;4)i%�Vꐕ٫� n-��s׼*F�������>�,Oq��z	��,���C��Y�>K����U`���h��Es�z����\bf䢦/H������x	���A.C��*8��K��+��t8�QҊ���	l-��L�Bz ����f�1j���/^��Q����G4}	Q�`�sz�Is�z�@�[sgg�I.q�KR��|NN �ƞ��4&i��+��`����ުW�Z��!;�f̱��I�&�?>~���-Pqb��K�Pwݸd�0���a�E9��S%��8�U�TR#��t�!Q�L�K��U������J�C#���
��6��־F��&\��y�5�47"���It+��)�3J�в�Y��x�
q-�@R-J��������jH�V�q7ɞ�!Z�R�8�a�Q��hyҌNm���$݃iD����Rp���J�l)��v�rd?�e2I�RCSh[�co?F1NBSL�_~�~�ť9K�	"=�İ�*�(�Ł�`�j�-[^�}I��t���FMu� Da���iY,��s�Ɇ�����Z^Vk��0��n�� :���y`�V"^�9E�(��J��a�C�I��A9V;�}E!�k�(8��Tw?���G�, !�3�	��S��� �ze��� P�D�VZB���ωp�{�\�_�r��vt�X�>��=�*g��7����a���+�0��ϰZ/�I7y�}#�%��|���.��\���ۉ�'<朸 �.��/�(���|ޚ%/���	��'C���t��昵��`�]SI�=�����16GS��FJ8#M�b�]�.0�̱r߯ �|�I���+Y`/��-�x�����_�(xR��D�t����W�m���[��
G��%H�a�w8���ϯ�A��unt�U܎���`��Yĉھ,�|>���8���(E_�0��x<8��El�0C��,b�@u�>H�N��@�dm�Ĳ�]��N��'��#��a"!�����Z	�ml�MC�zl
R��E�z	�`��;0V�^�O�ר�YΈ�&#%�B�bR���h��Ņ�!c*�&L�o�~3Vhr����o[{��$�|Q�)�+>�,o��Ek����c���|o>:���4�;hD��s�ec�Y�"�z�+sdAJO��LZ�)�V���}�8�8.��<U'������ҍ��ɞL̹���ƂBL�)<���JM�ڎYQt���Q�)'	�&е#����h�m�T��`bಝ$i�jH��d��+�Yj�GHC��`�xX�}"�d��=��������W�D\�� 0����{��J�ށ�H�D)���pF�E�SR�j���8#�x�ŘIY����X+�(w�����iKΊWX��`��>7�s�<R~���x��I+eCvZG�`�,o��TmȤ�����0#�z���k��CB_ /��q2��B��xF?v�7?���d5k0�[�������X`ik�@u�y���M��*Jɽ(�\T$���9#��!W�HZm�[�t��M�]v�����@�QX�����2�{�(��پP�)�����D�\%�MY}����d���#-O�����wI�2eDI��\3�z}e�l���=s�Ś�T�y&!H��
݅�l�y&�$K���qjG�S�:R��,��Տ���,��p&gF�H�N�xy��z�_�J���|X�X���D�"���i"?,�J9�M��졆�����(��P�����'���q��.
��IKyO$~�q�iK �YK"���4�8R����,PU��6T)

���p�&l1'���N"��B �#*9�Q�<6Z}j�|��#j/%2j���D��$�    q�9z,�"?�q�ڒ�q7�%�`��c�8ϰ�uRV�GT�"�jX��q���x�ܮ˚y�waA��A+�c#�i�Y���]��`U7-�ίFK~-��n��		6Q �8���V�s+�&�]˨g;6
K4�7&n�W7���y-��H2���)ZK�G9ܱ�ʺۀ�K9ʄ����*8S�d�~���ô7�����ɬc|y-ڍĸ�m�~��}��4O`Aj�<��h�*(��^xb��ʕ��s�V�ǥ�t�U+z#획�8�	�� ��m����f�=I��k�c[5ԜY�q��l�.3�m�ػf:��xr�L#R��XP�8���~���h&�n�3���G���/p�!1�#ee��a`�tz��ΰ~���išAe�S��ԋ5ۢ��x_�"0~2ʎ�p��plk{�KY0ls�������G�ʅqNP�)�l�3P	G󽦝�������?��a�슦Ϣx��}7��]��Ɋn�����ި��'͛�0g�ٹ���賦T�5̜�d����a���z8|�������'j͜$�.A�v�Rie:�B���4	N�u�]`T#��"����Ivߚ%*z �[}�h�
����b����Cx �\F�~vQ1���]�L�������5uf:��]=��z��F	���KC0k�a��<茄?���Uu�#���0M\�8���,���ī����U�����~GR󜐏��K���G���O�L	��*��^�������1�6�	��i��4�{b;es�=G���6����k�C5){�rG���8_���[ k!zC�	�v�E���z5�7���Mrk��c"�Û$�a]�k^��8��7���야h��g��ߴ��I��Z�IQ�8�1W���&�1�8L#�Wq�GvD5����)������N�7����	3��� .�i��".}���늑/�Ǽ|?�^��|%��M<���DG�/[����GџQ�I��y�����F����&���L�z ��r�)Lg4����p���{rD.�b.n4 ��vn7�ubJ;欳�װr�S+��y'�����I�����~������	�7H���Ʋ�2���������bq���G0�*^Z!���q=��ݦ�;���(;����k���uA�>�qԄ7�D��ɸ�� %x^w�$��>>����$��1k���'��Ds: �r��3*7�p�b�=�X�zG�d�#�����X�,�]��9#���0��e$f�r�U�2<��#�<��X�!H	b4#	�	G��4�k87��F�$��j�+V�\&�ê�I�5i d�[��L�I*j��F7aY��:���IA_T8�F��}ts@_sʝ��8iߵp/����nL��lt��P:��7.SH�@Y���"q�Rx+��Pn���*�ʽ��Ü���vwa��)��f����'� �+�:(2��'B����b�B��k�`yF��rڇ��--E��NereX�. �C���tK1�8�ɍ }��LԚ�4j�s���-�����]L����/�k��\�L�Y�瘕�p�pry7��ʭ<F����K�{�����r�hN)�o%gYYRA�&��K�������H(V�ʢ.㷌�o�xJ��PPu�KL�����h���upu`�p�)͖��Y�Ը�Ve�ԯK�I�E�KS;#��_Q�r�f��H�||{�lF;�u��7������H�	�H�&\�DCSo:`B� �+���c�xM�r���IM�>D^c kr���*�������=��D���5SQ3-{+H�.�2�EE��גw	�%O���J<�o�$?�Xd�ٓ�#:��}����ח�H�S�@(y�UA�i����Az��(d���9�Q<��	��C2��-q8�3u��ٕ���n_����9���y�Ȗ�׭~���9�FzM5w��i�Z�6sMs�Z
��
n�D���G�Bs������֎�/�G��.ٹ�w�\�	�ROo����UPu�̑89)��_ER���>e�M�:���26���N��[.�Y��h���A�q�p��f��p�@;)��њ���tX[o4�4�� *�F�	Q;���)�^�8ч�kĊ)=ޙ���.á��ڟ4ő�;ч���*��[����҇���Z�V���)���fϡ��m0ƥ��~�=_N��)��e��gӡA�c�z�Vv'-�������S�\�Y}87�^r��h�ٰh���KC)��W�#Xa;�c)y��jO�
f�m�^�������.aC��M)�-G\�Sn�F��%���;X-��|هk
�Ԕ�A����.0��8�J��+	.MΧ�u�$n�H\|�=����8�1�}��J�1�g�D,� |�l\�M3 [�`(Y��������g3�EJ�n�)���}��߮6M�J��?;Q�n�>㌾�a���~4I�1�Q�tm�P�K���)�K�v2�p����p{�#�S�� ~&�S�r���N�$��8���|�%A{�hMSI`�6�Sv�#�y���t&, ��UK8��|����9:��O2Z�ҋL�d&�P*	���6�S��(����LB�U��?��O�
���.��@����
v.���=���m��*�k�Ά�A��uW9m+nW�������π�nǖ�T`�:ʤa�`��,%*��ʮ�U��9cqpIX-�6�:Ɇlcy ��DS�L���6;��S�Ľ���A|�(��T���	�9c/�l!e���T�&��#��B��y5��=Q�I�w��yޝ-L�G�����wQ�y���8e�׊�^�=��7q��L���$��`�8�Ea=��hPQqE�ez&1*a�X�؜3���W�{!,��k�9�\%DNj|s�r3V�����z@;1���tg(�GNzm<K��v��mI=p'�	�Z.7�3�DB�Ě8�ט�͍f��s�7�{a*�y��hϩܲOY�Wv�z��,Wѹ`$�����J4�M������{���LT�-�f�,(���]���m���#�]�!/<����}�w���n$��]�rWtpɴ���y�*��LΖ?�fshx�]Ir&��.(�֍ci��z}�H<��:~}W�y'Z ���FWKk^*����O���xL���I��n�A�90[9�ȓ����k-�Aa��0ORQ1�fW�T�JF}�%SUW�`(���V�f?n�EC�1��8��%=�ݤ4{m�<e���U�cʞ���u@��������p��wN��~����*a��o6��Q�[�ߝ�E`���!����P�,�����߁i�g�o�ί��_Ek�wD��q�U��P\��$��{���
5Ǎ��S��A�Z�Vp�R��w�F��U��r8\+�g�)$���H�`An�<{���>oܠe�%!鱁9���8G߽� K����m����*B9��i�hm/{�������I���C�ݸ�u�.�2kG����N�OZ�4x�w=��6
��i '���Q�wm	<��%i<��h���z�N����#Ԡdl��W�������+ӪB�q�p9{)��3���e�0r,��_LF:{N3r�x��f5o�D�:�Q�i��>��#�f��c����RJԅ�ڟC�N�o�D���m��RQ�>yM�n}�������S���`=p�5��#v��@�Y&[�7�Z�.rcu.j\:��O~��I8[n��4
��!�@�"~��k�s]��H�Z�L�\Ƅ��#u�Y{�>��!7W��RNA>����ī���c�jP�[ωB�ۈ@�<z"����}ˢ�J�Z��s��bM٪ߑ��$�n� hC���Ӊ:G5��d�L4��<.~���*�Tey>LNPq���gy�e�]@��x���[��ٚԩD�k�����̅��Q�a$�x��t�Ԡ����݁�a/C�<��h�[�(e�1X~�=��+4܄2�ѧ�����%}L��"���t�I",F|`�:\����,��   �U�����:�$ls�m���8�f��H�:u���'ۃ�p��9�+a_�sؘ�gK�w��+�JK	��+=�!&%`��`�P$.�DLfly �(i��\G�
��&H� Y�e�&�G��c�����\�k9��&�#��9b��jo�#jth(�d��X�������`�[<r���.�u�+�p����j����<�-M՟�"��ע���	4��f3/�fO����
��T�,jh�h5]���-��.ʞ�]0�ꥸ6����g����d�$�P��
����d����*����4���L��}_�㱜��HǱ8܎�P����yv��S�U��ō\��y� c4ȣb�iw`�8�Vo���!.��le��ԯ�|5���e�eqF,s�����i镰�Q-�� ����A���������+~��z*݃y��Ē�����`G�Օr�r�!ȓ$��J��/�J۳B��pD�8��r�"�u�B����1�$�(�h4���Z(�MK0Zf~�{�"^�h�������l��h�X�ڏ�N��]T~�19�WB짨w�K��8��CkLIﴘ��c8���U�r�'�������q�W76`o�*��&F��c+����M8-��1�������Wc��5��,>c��=�D���,��Z��waX��hUi�Fr��v�+fa~	X���%�T��[�����u!1���J |��>��׷�С��('��RƤ���6�?AQT�8㯧0��Һ��xU%$�	!�'%�aߒTꖐ����*;��[��
K(��2����-��"�c�ށi�g��l��Q�J*e��R�(a\�'N�D�J4o�_��j���v�y��u���W	Em$]��t��N�/	��I�w�$Rb�h�O�^D����՘���;0�;��h~����2�d�"���츗X1}Ʊ�$A��}�pq� 6���049p�Y�X�i�����X�G�Ǔl;.�B2W��N�^f;oL2`��L�q˜2C�t�"�䁋"U�%%,Ϟ|;F�����N2��qH��(%>[Y��GZ�|r�oI桶;8�w���2��x�s�6G����VF����QX�if��D�N.d���Y
I���v�]r��%��-�<���l<)@�_��4�f��sS�d>�r7a��(=/�T�OZ��q4��ErA~�U	yb�a��"Wb�2J�3��ы�Cť��k'6�_i$��D)tPŷPR6��`����\Ä��i��R���(v���et
N�`��Qr\���]���g�bҋ"�~��d|��&JsN��R����DY�ߋ�$�QFG���k��o~����;8�j���:l0e����r?G�Z%L2>��~E"~�?�]`���Q�1�Y=����>��^NC����p҇]�^.5���B�8_�#I2�������.��%�E;���q��G�h-�!�p�"�d&9캏�rܣ�������0|�r��Y�A�Gr�݅i�����>:'��Ǐ�*�f��l{���w��p��I}4\��s�,��/�����QLz���$7�j�D��E��+�R]����r�z��v�Ye�*�x&&�����z��;���YD���Iem��M���K�Um�
��ϒ;M��L�� ����#����x��>��e�� �=BU	�qO��$�����l���~DӞ�V�Z�>P�uť���U7*Olx����j�� cܯ��.��p%�����y5��C�A�J�B!>�'��VpT����ؾN��{%�`�\��f:"h5LO�P�x]�8}�B��JIK}N,�⪵*5���z�?a���G�8Zi�Zswa�\���*UL��C��6��jc���"j�?�`�_���G�_��0����𒆮������"U�>�aX�x����086��PT�,�v]��4�v�||��=��=���^l��/'.��� �O|=^�/X1eaa%ZĶ���2Ɋ�_ރy	�p����j�=d�h����F�=X�oa��r������+�Z
�c�{0�l�d�AŲ�3��Qm�T����a]T9����	�A�ހUICs�S��;4��~�n��4�M�$��D����0=�u�7k�Sw�-gf3`ֲl�g߹���z��*X���8\X#�$�0%A�	u��u2�Q���"����bq�s4�Ȏ��2�xHh7���k1i|8=��P$�SҌ���e�z�w�j,���>�z�<
�bI�F��uմc��d�:�� �&��YG���~ִ�MtH���	G�*�W�r'����W;sqVMA]ov�Z�r�������?Q�&:�~+n�҇��Aʬ�r��2���Ǿ�f3��&r+,��s"D㧪O�܇���/����E��쨥¸='��u��39�4�|���^�z0��p��$wAyE�G(�DU79��S���5QW�]Y&�3��F�CL�l^V��x0�\/¨�W��@�e����К�Ff�ihX7�b1�M�>�#�Ӝq�`�=VR,K���C�ѣ�AFc6��@F-t�o�X�5'�?݄q!F/RguZ�Q5�OV1�]\-��%�����	�aP��j�<����ft�f�ہ���Q[���ZUTK9���ɳ�N�M�T-��G��;�H�uǞ�CPN�f��_Y��م�]�@�)��E�YI��<���a���F���SW�X���گ�U�⿤��F}ʝ�`�_���Z�!�r&�-�.Y���|�a�|�	2q;��O�h�fT���ы���C��H�s���mݾ��5µO�Z0W�E�T�`�7�}X'��L�ǹ���ck���z�?���e�͆�'t�.�ޞmj0�����+I�φ:��7QQ�Z�m�_�7.�D[1��N\.�p�P�t���W1di;׾>Z6ңav)*uL��/��<�Ԅ%d�w�9�T��<��&PCѡ�!`4��)���Ae���WM>�$��G���.����YM�SL��\���'0���U�׆J'��`^"%E�x�i~ag�1��o��������u����>�a�L�٬s;�V�@���mr/-!0��=Lz�h+ֆ��z'�`��jH�5�(Oy������v ��Z{��hƿg��x{:=�)�TR&���+R��3s�+ZȠ��Y�ĎT���{0m]e�z�n²LRĩ�1PcF��P������{���	�\Ñ&�����{RI�=��{�+������<��1c&KT��,�(`ф;`�'>i9��`����k>���Rє�W�$�WJC�7���v�R>�#{s���l��y�����o�Oa��qE�)�6����l�EJ�w ����քHU�k����UN{���M^M"�WDb�`�#n�m�CT��b�ei���F�7Qʎ��g|��*�hh��F&�>,hǼ��b!3�h����<Ǹ|�N.z���r��z�!�v�1'G��+�����A��ପ5z�\w��	���>5i�?R���lLz�>1�+'�6�׷��1<S�sfs{��p���F��|����)����Or��=��\?��T�OLٯ�Q��%�!J��Չ�qY��9�ڛ�_����a4Tћ�����H.���և�����6Oqܨ��8>6"��@�]���~�Z�y�1�8R'%|���(E����N\.(]St.� 5�X��n:��.�n��L��ʻ�3�uゑR�'U&�)�ܽ�ﺛ��������VTvf��H��~PǤ�=Wgq�h��:���v齿� '����0Wfmi���~����ה��en}]�跮Ձ뫣�[hq���˟~�r���?�����y      $     x�}W�r�6]�_�]VV��KZ�������X�L�T6	Q0!@�n�&SSYL�S��*�� $-��fc�q��}�{�uLV;.I<��"Z�B��uK��l>'[G��蚰�^ИQ��]����QA��K%�;����w��Z��{+EE���eΝ�=4u;#�<�ђ��v'��z+���6��i=/gܑ<���C�[�1��}r$q�������+���'JjF�`�F1�n�.w�6�#���팋>�S�b�Kȵћ�0}#��pJͶ'��ϼY2c�/6��=V晓�Mo����*��\*Y
z�w�ф���Nj���ڱ +n5��F�GY��|�6g�lHmI��^��ΔF�Ӓm�ˮ= �z��D:���l𱖖>�J�#�{��+^	��r��/���#~�.�� ���g��x>91rշ���Z�{�R���b�a��<�Z����5�Y���r��{�;�X���,s*9ښ�fu���o���߷���[�׼�XY�a��V�m]�TC�����/��s/�w �&cv~� Wd�}
�.w��%u����B��d��Y��ӗ��ƭy/lcy���c���PO6�]AE�0���7+5������۶#Y�x��lyߺ��@l��K�������0��I�;��a��F�l�Xz�%1�2�6�3ʡ�BIm�&��<�(a䆷%� C�H�d�<;�B6na��+!;��y��5o�����K%�I\�H\IF֝J��θ.~�|"�$'��uE�R�!A?�@B##�����WT�P�O��`�O��6VXHŏ"-Ք˓PRX:B��}+賰� R(Kz�p��Y�霼C��+�7�,�N]��O`��dҘ��������])�w��v��G�r�g��a�u��
��_L�H��{/7B��؁,4�EiB>̎��vC0��-�_�O�d����j���7��#ͥ9YD-�_ӯ��]O�O��m�h���-	d6�L��	��r̝͊��)�H�!\U�Ny"7����H���}�8?_��OT�1b�'����^��29�Q��2�1�^*ș|	�	n�ȄYB�:�8e1�vkD%s2��N��k�0����?g������+-w�j�y}��1�`DmJ��JRm4H�k����X�Y���8�^�����8���QGm��/r�M�������%B�T�q+XV��^��hf�H2`�ߋ�-��RXk �4kz]�s����#VSP�c�%���>/gI@B����JM��k�T�!aB6��{2�EyA>�F�k��wi=aYq����?��h~�C�~4��`E�7�?�`$ed���UP
Yq�:���ا$�.���6�e��)�l:c�^�N�cȯ�}���`>�V(��s%q9i�-iH|�S�ı��@��(:9�H�녒[A�����x�N����wc���k����ȱ��,��5�Pb�I5W�9}��k�^�	�Բ������A ����w�RP��b@����5��[����^���}�X>���~�4	��3@�S��,ʝ^�j�a��[��/{���JHp��FfĢ�;��'c��I����R���wKӱ�8��;2\�L�_���,4�]p������?���c
�IC��_��@��N�B�F��"��JB�<!?�Z��v�ӭw��bƖ�2\z�JGGhxA��z��K�r'3���??�w��h��w��B���P�PPQ�;+k����r�l��x�ʞ~é�6��}��!�@3,�iE�	�љ          B   x�3�.HMM�Tp�((J-.�2���,IMQHL�NLO�2�tKMI-J�Q��,(��K����� .~6     