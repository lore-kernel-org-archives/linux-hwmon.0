Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E231922C0
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Apr 2025 06:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744181433; cv=none; b=CjhhWIdTFf+NGP3MBjFAvObU7lQyg5ETTTXpxIG7hIeV9521Eu2T8RkFl7NuWCAY/ln+U3a613qf39sh6XkiAqNJw5TwoaDRyHaaXnafBqBzE3oXXkyiIlVw+wggexim/IJkmNFx03ZbefrGnonqdJzi7N2xIB6bUKIENHllwOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744181433; c=relaxed/simple;
	bh=HFQKGJU6mKJL+ruRakJThO06ehhCZDvf53JOX8LKVLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m+jjD86qDUWzbDCLB41x+aSBH+tBQSVZWgsIR8eXEesYq7ZGl8qR6f9Ry8nWwELjhuQoFtvLwwrqJz/AAEI63may5gemXDbAF4mbbqh6GbK2YoYDHdDjdbJyXiIjbdk9Dgcy27M+43mlvUnALAdPMBNq+nX+XzW4KVdMBGqWqOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=YkDqw7wt; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=KYryM9LG reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="YkDqw7wt";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KYryM9LG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744181429; x=1775717429;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mH2TGq2p1YS2DqjyBGpm6hHbjuIkDrcHJW4JmIfLQnc=;
  b=YkDqw7wtXVHlEP0XEOzIui8SWfhKVgoHfFQFRM1mODT6O/l64yfaMNWK
   QaRjen7A6b7DU/D8C5Qu2Xeo8wmAa1c8gi9yXYSZaxh6i2r20a0Bv9yY9
   hUP2T7mRqdsxAyJQHrX9GKBbPOULMlaU+lIAdne44yYJg01o5SXxBk/8t
   RclE0JmjlRO5ygoujF+NWJmpAc9PgBhSgTXZOaOjzkkuhcZliklZEGcxB
   j7Rixmp8upPVODKxidSPk28bMKt4lvG26A07Ob/2HurtTjQe1RME2FL8E
   0fOMRSh0Y2Onuijw1mnKXhY0AjkXN6AcpIO9yxHD69Kj2elKpZXII0wMt
   w==;
X-CSE-ConnectionGUID: 4vCuW8TxTUKEaOpsdUWIpQ==
X-CSE-MsgGUID: sKgs9UxsTQSM6RIGYgGYiA==
X-IronPort-AV: E=Sophos;i="6.15,200,1739833200"; 
   d="scan'208";a="43417791"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Apr 2025 08:50:20 +0200
X-CheckPoint: {67F618AC-18-903EAEAC-E04C76C8}
X-MAIL-CPID: F6B75FE26B3F851CDCE36D5EE77E4CE8_5
X-Control-Analysis: str=0001.0A006371.67F618A9.00A6,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3FBF7164083;
	Wed,  9 Apr 2025 08:50:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744181416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mH2TGq2p1YS2DqjyBGpm6hHbjuIkDrcHJW4JmIfLQnc=;
	b=KYryM9LGBF+K4a6QievttPHsl+5g0bz8aoxwXxPZQS0YuGqkJZc5Qvx0DzdT6YIJ+XLHxw
	DGEsg/JIl/x9/rB0h9sXUCZU1dk5zgXO9A65uLlsZQXso6KD4OLMRDj9bqu7xY0cFVmF/E
	qDEWvFUwh/PsJBG2TXNMEU9LILAOymXpYWiNZVQ4cbUe2qmPkalkVZbpNAJI4Wl/Zpxj2L
	SKHVbFbYz906tYXh9Wld4H0rcsdtQ+inw8QomFsVImwn4DHh7rhlAkGO4h33QL9Bz2smFa
	Yst28YfC7LMhvayjgWbRam1CjSep66wlva3qb6WqhqXXAxNdiu/re+ebGF1NNA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: kernel test robot <lkp@intel.com>, Guenter Roeck <linux@roeck-us.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-hwmon@vger.kernel.org
Subject:
 Re: [groeck-staging:hwmon-next 13/13] drivers/hwmon/gpio-fan.c:250:6:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 false
Date: Wed, 09 Apr 2025 08:50:14 +0200
Message-ID: <2368483.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <82d98804-e9b6-458e-bb39-3a48c10e9f70@roeck-us.net>
References:
 <202504091047.biuX8Kl2-lkp@intel.com>
 <82d98804-e9b6-458e-bb39-3a48c10e9f70@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Guenter,

Am Mittwoch, 9. April 2025, 04:51:35 CEST schrieb Guenter Roeck:
> Alexander,
>=20
> On 4/8/25 19:11, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-st=
aging.git hwmon-next
> > head:   d6b1492c9c2e7f2659b63a165ea45ab556c0df0c
> > commit: d6b1492c9c2e7f2659b63a165ea45ab556c0df0c [13/13] hwmon: (gpio-f=
an) Add regulator support
> > config: riscv-randconfig-001-20250409 (https://download.01.org/0day-ci/=
archive/20250409/202504091047.biuX8Kl2-lkp@intel.com/config)
> > compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project=
 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250409/202504091047.biuX8Kl2-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202504091047.biuX8Kl2-l=
kp@intel.com/
> >=20
> > All warnings (new ones prefixed by >>):
> >=20
> >>> drivers/hwmon/gpio-fan.c:250:6: warning: variable 'ret' is used unini=
tialized whenever 'if' condition is false [-Wsometimes-uninitialized]
> >       250 |         if (val =3D=3D 0)
> >           |             ^~~~~~~~
> >     drivers/hwmon/gpio-fan.c:255:9: note: uninitialized use occurs here
> >       255 |         return ret ? ret : count;
> >           |                ^~~
> >     drivers/hwmon/gpio-fan.c:250:2: note: remove the 'if' if its condit=
ion is always true
> >       250 |         if (val =3D=3D 0)
> >           |         ^~~~~~~~~~~~~
> >       251 |                 ret =3D set_fan_speed(fan_data, fan_data->n=
um_speed - 1);
> >     drivers/hwmon/gpio-fan.c:237:9: note: initialize the variable 'ret'=
 to silence this warning
> >       237 |         int ret;
> >           |                ^
> >           |                 =3D 0
> >     1 warning generated.
> >=20
>=20
> I dropped the patch from linux-next. Please fix and make sure there are no
> such problems before resubmitting.

Oh, surprising. A W=3D1 build on my machine doesn't raise this warning. I'm=
 not
sure if this is specific to riscv or clang. Nevertheless this is correct and
I'll send a fixed one.

Thanks and best regards
Alexander

> Thanks,
> Guenter
> >=20
> > vim +250 drivers/hwmon/gpio-fan.c
> >=20
> > d6fe1360f42e86 Simon Guinot       2010-10-22  230
> > c490c63e9505a3 Julia Lawall       2016-12-22  231  static ssize_t pwm1_=
enable_store(struct device *dev,
> > c490c63e9505a3 Julia Lawall       2016-12-22  232  				 struct device_a=
ttribute *attr,
> > d6fe1360f42e86 Simon Guinot       2010-10-22  233  				 const char *buf=
, size_t count)
> > d6fe1360f42e86 Simon Guinot       2010-10-22  234  {
> > d6fe1360f42e86 Simon Guinot       2010-10-22  235  	struct gpio_fan_dat=
a *fan_data =3D dev_get_drvdata(dev);
> > d6fe1360f42e86 Simon Guinot       2010-10-22  236  	unsigned long val;
> > d6b1492c9c2e7f Alexander Stein    2025-04-08  237  	int ret;
> > d6fe1360f42e86 Simon Guinot       2010-10-22  238
> > 179c4fdb565dd2 Frans Meulenbroeks 2012-01-04  239  	if (kstrtoul(buf, 1=
0, &val) || val > 1)
> > d6fe1360f42e86 Simon Guinot       2010-10-22  240  		return -EINVAL;
> > d6fe1360f42e86 Simon Guinot       2010-10-22  241
> > d6fe1360f42e86 Simon Guinot       2010-10-22  242  	if (fan_data->pwm_e=
nable =3D=3D val)
> > d6fe1360f42e86 Simon Guinot       2010-10-22  243  		return count;
> > d6fe1360f42e86 Simon Guinot       2010-10-22  244
> > d6fe1360f42e86 Simon Guinot       2010-10-22  245  	mutex_lock(&fan_dat=
a->lock);
> > d6fe1360f42e86 Simon Guinot       2010-10-22  246
> > d6fe1360f42e86 Simon Guinot       2010-10-22  247  	fan_data->pwm_enabl=
e =3D val;
> > d6fe1360f42e86 Simon Guinot       2010-10-22  248
> > d6fe1360f42e86 Simon Guinot       2010-10-22  249  	/* Disable manual c=
ontrol mode: set fan at full speed. */
> > d6fe1360f42e86 Simon Guinot       2010-10-22 @250  	if (val =3D=3D 0)
> > d6b1492c9c2e7f Alexander Stein    2025-04-08  251  		ret =3D set_fan_sp=
eed(fan_data, fan_data->num_speed - 1);
> > d6fe1360f42e86 Simon Guinot       2010-10-22  252
> > d6fe1360f42e86 Simon Guinot       2010-10-22  253  	mutex_unlock(&fan_d=
ata->lock);
> > d6fe1360f42e86 Simon Guinot       2010-10-22  254
> > d6b1492c9c2e7f Alexander Stein    2025-04-08  255  	return ret ? ret : =
count;
> > d6fe1360f42e86 Simon Guinot       2010-10-22  256  }
> > d6fe1360f42e86 Simon Guinot       2010-10-22  257
> >=20
> > :::::: The code at line 250 was first introduced by commit
> > :::::: d6fe1360f42e86262153927986dea6502daff703 hwmon: add generic GPIO=
 fan driver
> >=20
> > :::::: TO: Simon Guinot <sguinot@lacie.com>
> > :::::: CC: Guenter Roeck <guenter.roeck@ericsson.com>
> >=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


