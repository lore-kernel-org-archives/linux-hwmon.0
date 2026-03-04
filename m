Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED773A6F0A
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 12:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772626785; cv=none; b=ccp1Fz9SnBvsKTWioPKbPo85/9XNlupJtX7F8zSgAeVhogIyF899KAxaJNhMYehz/BUSMbda3cBT+WrOf1goZsj8PAzLDKpf+rD1sJUcD/WXkMXFziz/64eUMunHxgj/+xQ66UPwySbABeUf4kBzGffGP0F8NZvamn82PuBXTyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772626785; c=relaxed/simple;
	bh=8jaB9xhr+C3taJqbbWa5n/w0SjBdD0Ab/HQmNKTmf5w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DX6b6OcXbr9LnVGWDJGouT+DlCMDB+O6nH499FQMrk5dh63jlNpAUh4iJTjhd98cmsG5ytp9fqkXyP+nur//F9Eh/CfVx8a50WZcHjz7qoXvYCtN6dsZ/YahSulGtP4ysFNuimmV/H1ucFwOj40NRMuVPQ8cUk2RhQqZtq1Nxbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPGS7qcY; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPGS7qcY"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439b790af67so1934079f8f.0
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 04:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772626782; x=1773231582; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FrV9cbgp4wuO7j5QZsaUWjFR+kDOuc1YVBeslenYsE8=;
        b=mPGS7qcYgizPq0GUZEFxBiiZXF7J3p+av3wLK1Y+kbcw9Zz4Hi0XPDjE3MnudZb42x
         5MYVxuHHhzpxS2V1aHm8eI+I+0Tf5qIbElxaYYqDPw6Ax73zRmJwkyr+Nysi17c3Rppk
         z3its7D8ypyaT2gg7RKuZ41epVo8umsilAbjwI+JvMbz8QZq14KK19EBTMSgtt/4ZcgC
         RYnH2xIRZK5G2+Nmim/vXEx9EZPOcuBR9n/t2usMiuG9OyopEW+fTr9+MOhZbKj7JXvF
         B6GNfEdf4hIXoIOf9zT71etn5a5IE6Km6u7TwlZNblgB6hj/NClk9fd81to/W49WEJLt
         H5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772626782; x=1773231582;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FrV9cbgp4wuO7j5QZsaUWjFR+kDOuc1YVBeslenYsE8=;
        b=sGEihm8L4JczLLrFAzz5o9uQtjvZ4pOQEFZk6PBJOFhxB3XWvw3x0BQU2flboW+/IJ
         wWqluhuhzi+ChqkjGX9pVPxdLlFN8tYK3xdu8Sf4M+/zlsFeygqR7Ch1XHZ1ViPEGJ0e
         UIXt397msiExsIqEx7eSqbtYvmS3fixV8idcmkkVZuqC4+Dbjg9JDT7ZTNBOxlHAnGCo
         tEyTlNjehxTn4SD674A7ScHuYdtpMkAuQD7GBi2lDh1SXSxIFkYYnyFxUU6txfHWYm8r
         LMbx8x0k+5wbXfwIWw9BKNCA3u+OqLcF5e1XsUaZcfIz72RCzthpgWAHlsrnEMHjRMtt
         L0hw==
X-Forwarded-Encrypted: i=1; AJvYcCXzqdUXZ0x8Jjj3YNLlIQJgUap5al5bBylwisqlP0Y0H9+1AU5cQY3+JBs7mLibuNjb3Y+XlQOlW++few==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQP3pourIBgxCkMG0c1zKNo8bzUBqkqYAYMkTosPxHB+yV6QVx
	zRon0j5HBSB4r5fphIfSH/THDnnGuwdkjDcqqycpqRDSiDW5ruFJs7cH
X-Gm-Gg: ATEYQzwKheDLEktFDQLEBupVm1yvfb3zSV69KUzCXcEhx26/e3XuxTuLnZU18WMu1eV
	ThctLizbyrS34Q19yZ8gT59H/lme0+UQqnX6+ltCdxAH40cYnGv+asm4ZNqgK9m7E10yFjm/Cir
	5nkZhQFV0s/3ZeG2UfIi1eDCpfOKuY/SlOXVbJBKdENb9oPtYOwGwJgqhHYsaUWNfmEJjWOS19W
	W4Bj0Ve7r/LQh/7owlHE0lwybumXsphUzAvR6SRFm3EzGNjrlIOeLlHjcReR8ZmrXh7JgI4JtE7
	46VrettZdaK/ew1yGuX+uykGs/JUODB567hjPdrwDa+apSL0Y80oVeKay8dyund9Z7hqcZ9rnjm
	JyVXmi6iBZfi61x/YJ1JHTxhYs+HOcidl3IPOaYYWYbDNaMVAAOg0ALZnOhqIQt9o0J7gOXAed9
	hCX3BLfgORjDY5Ow4P8i4bEvH2XOBuwiI=
X-Received: by 2002:a05:6000:2912:b0:439:b9e8:635f with SMTP id ffacd0b85a97d-439c8a9f004mr3065699f8f.21.1772626781522;
        Wed, 04 Mar 2026 04:19:41 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b3cc2e65sm27010827f8f.2.2026.03.04.04.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 04:19:41 -0800 (PST)
Message-ID: <f3fa4c490a61c4544fa93682f3dd18e0f98b8473.camel@gmail.com>
Subject: Re: [PATCH v6 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: kernel test robot <lkp@intel.com>, Nuno =?ISO-8859-1?Q?S=E1?= via B4
 Relay <devnull+nuno.sa.analog.com@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>,  Jonathan Corbet	 <corbet@lwn.net>, Linus
 Walleij <linusw@kernel.org>, Bartosz Golaszewski	 <brgl@kernel.org>
Date: Wed, 04 Mar 2026 12:20:25 +0000
In-Reply-To: <202603041109.HFnPWnj8-lkp@intel.com>
References: <20260303-ltc4283-support-v6-2-efe11502fad2@analog.com>
	 <202603041109.HFnPWnj8-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-03-04 at 12:05 +0100, kernel test robot wrote:
> Hi Nuno,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on 78558965440b27814592ec82d8f3668395953b1b]
>=20
> url:=C2=A0=C2=A0=C2=A0
> https://github.com/intel-lab-lkp/linux/commits/Nuno-S-via-B4-Relay/dt-bin=
dings-hwmon-Document-the-LTC4283-Swap-Controller/20260304-010255
> base:=C2=A0=C2=A0 78558965440b27814592ec82d8f3668395953b1b
> patch link:=C2=A0=C2=A0=C2=A0 https://lore.kernel.org/r/20260303-ltc4283-=
support-v6-2-efe11502fad2%40analog.com
> patch subject: [PATCH v6 2/3] hwmon: ltc4283: Add support for the LTC4283=
 Swap Controller
> compiler: clang version 20.1.8
> (https://github.com/llvm/llvm-project=C2=A087f0227cb60147a26a1eeb4fb06e3b=
505e9c7261)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce:
> (https://download.01.org/0day-ci/archive/20260304/202603041109.HFnPWnj8-l=
kp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202603041109.HFnPWnj8-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
> =C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [docutils]
> > > Documentation/hwmon/ltc4283.rst:258: WARNING: Blank line required aft=
er table. [docutils]
> =C2=A0=C2=A0 Documentation/mm/memfd_preservation:7: ./mm/memfd_luo.c:13: =
ERROR: Unexpected section title.
>=20
>=20
> vim +258 Documentation/hwmon/ltc4283.rst
>=20
> =C2=A0=C2=A0 256=09
> =C2=A0=C2=A0 257	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D		=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =C2=A0> 258	power1_failed_fault_log		Set to 1 by a power1 fault occurring=
.

Arggh, will wait for more feedback before spinning a new version.

- Nuno S=C3=A1
