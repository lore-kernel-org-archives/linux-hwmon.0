Return-path: <Chris.Packham@alliedtelesis.co.nz>
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: kbuild test robot <lkp@intel.com>
CC: "kbuild-all@01.org" <kbuild-all@01.org>, "linux@roeck-us.net"
	<linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] hwmon: (adt7475) temperature smoothing
Date: Tue, 16 May 2017 20:30:52 +0000
Message-ID: <247018ef273f4af9bedd77e63417daf0@svr-chch-ex1.atlnz.lc>
References: <201705161614.nmuA5Qiv%fengguang.wu@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

On 16/05/17 20:23, kbuild test robot wrote:=0A=
> Hi Chris,=0A=
>=0A=
> [auto build test ERROR on hwmon/hwmon-next]=0A=
> [also build test ERROR on v4.12-rc1 next-20170516]=0A=
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help improve the system]=0A=
>=0A=
> url:    https://github.com/0day-ci/linux/commits/Chris-Packham/hwmon-adt7=
475-fan-stall-prevention/20170515-093530=0A=
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-stag=
ing.git hwmon-next=0A=
> config: x86_64-rhel (attached as .config)=0A=
> compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901=0A=
> reproduce:=0A=
>         # save the attached .config to linux build tree=0A=
>         make ARCH=3Dx86_64=0A=
>=0A=
> All errors (new ones prefixed by >>):=0A=
>=0A=
>    drivers/hwmon/adt7475.c: In function 'set_temp_st':=0A=
>>> drivers/hwmon/adt7475.c:622:9: error: implicit declaration of function =
'find_closest_descending' [-Werror=3Dimplicit-function-declaration]=0A=
>       val =3D find_closest_descending(val, ad7475_st_map,=0A=
>             ^~~~~~~~~~~~~~~~~~~~~~~=0A=
>    cc1: some warnings being treated as errors=0A=
>=0A=
> vim +/find_closest_descending +622 drivers/hwmon/adt7475.c=0A=
>=0A=
>    616			shift =3D 4;=0A=
>    617			idx =3D 1;=0A=
>    618			break;=0A=
>    619		}=0A=
>    620	=0A=
>    621		if (val > 0) {=0A=
>  > 622			val =3D find_closest_descending(val, ad7475_st_map,=0A=
>    623						      ARRAY_SIZE(ad7475_st_map));=0A=
>    624			val |=3D 0x8;=0A=
>    625		}=0A=
>=0A=
> ---=0A=
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter=0A=
> https://lists.01.org/pipermail/kbuild-all                   Intel Corpora=
tion=0A=
>=0A=
=0A=
I'm not sure how this is failing. find_closest_descending() is a macro =0A=
defined in linux/util_macros.h which is explicitly included in =0A=
drivers/hwmon/adt7475.c. Aside from the include guards there's nothing =0A=
conditional about it.=0A=
