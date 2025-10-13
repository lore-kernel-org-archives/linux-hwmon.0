Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93802261B7F
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Oct 2025 11:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760355884; cv=none; b=QalCvCWDoB0s9f9oGu82mXcU2eyxCgbQ0KBezIOlmnc4KB+F4jvyZqK7RIJJinwAHVegewS+QTotd9t4/9+7fiN8zF8gPpHRAruuGG0X6fcOPOpv6aoGjaOqVWI/+Qk7Y68KJhlTiI07Su7VSyI3b9Md6KpcRs9tsiQtJfG5znE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760355884; c=relaxed/simple;
	bh=m+468Bkpx6SzNqN/4WXzwZci+NKwPHmCNWkdu04s/WI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rt82dD3EDiTqgSanPK4NkRPeWSPVd5g84DouHz1SiWI7L6D564e1Jro8hq7iUifdmZ7fv1un6YzjMD8RSbF1LyWUsgDCZotfJjxAzcIb5albm3gwfYbxtY64vJQh2UgE9GfowU/7OQizNAxPD2mi8/9esEBIXGEmmWx7tSICyO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBzXD7Z3; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBzXD7Z3"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-586883eb9fbso5507874e87.1
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Oct 2025 04:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760355880; x=1760960680; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1K17b/K8yQXfwqlp4oNmjpZOU5mgfldRYoFZRQe1+Os=;
        b=nBzXD7Z3pdwY9D7IpyuoujXnUAyIh1t5q+vtrs8Ow2m+kBQj6Aj8DXR2t51Du40O/O
         yU2w3pcQg+P3/eQNDIJgHLKMYf6LGcArFHgIm6CzFVrBoPSp8a8o0R6+QSFFwsdc65Vh
         UaHcl2TlFPmeHuf/ZhS4UM7ByvnYSSR+rpemi8zeOiIaVfwD9eyUq7yopjVOBSd6NvVC
         BuQnMn/IzeDGdWQxNOFv+4GikiyO0B0UCq/fZ4VItfOCbw+AJXbIZGjhvqM3mOoRvbs7
         HBMgx3EHu+1mNfiQYoI3kscRCJKqCJjDXyooozdQvFQ5xzoM27vTocJ/st7UtxqkOG3n
         R79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760355880; x=1760960680;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1K17b/K8yQXfwqlp4oNmjpZOU5mgfldRYoFZRQe1+Os=;
        b=d58aQAduydRdqRK+IfZJOkf4eRf4Pt906QKmb3qEaRxLUvNpNzqEdH7ONR9K+5C8sR
         sHo5lmGC8yKrFEnqp+Cx4HaDp0IiDjvhT5TSQ2GWCHrag3RyfTV6yzG2buxRTtGWmJ9m
         yCVZC261fePi5Eh9vojp3e1aolrgKkigEhzSw7Q7u8tOMab8Yo2oGW0TM1X+ALQDR74R
         Zq8yOTgdHfNV2jFQKt0HmjNTrgQasIMsSljA/RAuiKVbgmRsw1pgXQt9J8aVCfjBNJPh
         YtM2K6PzsCDV0eTxIJP+HoTSGCIWcLVwqaCvIaifSdLv7DAW4ORZDBmNWyP1NhEvrjzF
         Rpwg==
X-Forwarded-Encrypted: i=1; AJvYcCVdJ2HB+IC4hiksv4AC63KVEUp5w0QuhPquAxCGqPf5GhCMZfqJ6ZB1tmDJd9rp5AI46+eC8R2/k42hTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBjD5n2KS/KO6SoxOalcXZ1deidtGzYcYwTrZ0h0M20Bf3nyNF
	RoV/gE4EjmMEHfVvqDrA4GgsRDjRtPeAU/AxcbR7O+vvEUcpTOTp6iZm
X-Gm-Gg: ASbGncuPlG5c+1W6wY57U13uoVjPvqvuuPeRPGbm4JkPMXvnzNpl3kPkTT2qaZdSqUR
	FZMvGDN8MDD3FCh5nIOc97GEYhHkcgWKegp+osOfSSgJXOP513t4+bsDhFgMhprxcQn0B//bsvp
	00jO9o3l0jMR/JS+3LCmujSLRmHAxzV/uw5VHbrh4Z2nTZHRJ6xj4qRvuTg3lAwhJpRa3nLIQbL
	LizlMu5caFmOM+aCOg6IcrhzrcB/Wcs//z/7NDvVlV12iGrVM7Tx2xSMD4FvmKMDvyuTTcP1XHM
	KsxZqwEg7h/6iw6Ag8r5BKo9RIE99RP1xYIwJwD5B4/bHLUGGSXDgPu9XccxISh/Afac9451K3Z
	qR5AlJbu0Tz3sMLBjHqrYKM5fRq0nsN7+DUUDFApCs9Vo
X-Google-Smtp-Source: AGHT+IE3d16akBxeLLNasuVPZAcPS6yQwFuxf/4sTLdfKlAN6I/lYxBnzcpDd444DNztoAVGRjcn2g==
X-Received: by 2002:a05:6512:682:b0:57e:3d46:d6bc with SMTP id 2adb3069b0e04-5906d773518mr4914882e87.1.1760355880260;
        Mon, 13 Oct 2025 04:44:40 -0700 (PDT)
Received: from [192.168.1.161] ([81.200.23.195])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4f26sm4063733e87.9.2025.10.13.04.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 04:44:39 -0700 (PDT)
Message-ID: <9badd4e53ddb6166d0aa196da978bd70f61642de.camel@gmail.com>
Subject: Re: [PATCH 2/3] hwmon: (peci/dimmtemp) add Intel Emerald Rapids
 platform support
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>, Guenter Roeck	
 <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	openbmc@lists.ozlabs.org
Date: Mon, 13 Oct 2025 14:44:34 +0300
In-Reply-To: <0ede72a9-4555-4e4d-959d-3a505b6598ee@molgen.mpg.de>
References: <20251006215321.5036-1-fr0st61te@gmail.com>
	 <20251006215321.5036-3-fr0st61te@gmail.com>
	 <0ede72a9-4555-4e4d-959d-3a505b6598ee@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-10-07 at 10:26 +0200, Paul Menzel wrote:
> Dear Ivan,
>=20
>=20
> Thank you for your patch.
>=20
> Am 06.10.25 um 23:53 schrieb Ivan Mikhaylov:
> > Extend the functionality of hwmon (peci/dimmtemp) for Emerald
> > Rapids
> > platform.
> >=20
> > The patch has been tested on a 5S system with 16 DIMMs installed.
>=20
> What is 5S? 5 sockets? (Probably not.)

Paul, thank your for review and sorry for late reply.
5S - Intel 5 Series/5th Gen

>=20
> > Verified read of DIMM temperature thresholds & temperature.
>=20
> Also paste the output?
>=20

root@bmc:/sys/bus/peci# ls -l devices/0-30/
lrwxrwxrwx    1 root     root             0 Oct 13 10:51 driver ->
../../../../../../../bus/peci/drivers/peci-cpu
drwxr-xr-x    4 root     root             0 Oct 13 10:51
peci_cpu.cputemp.emr.48
drwxr-xr-x    4 root     root             0 Oct 13 10:51
peci_cpu.dimmtemp.emr.48
drwxr-xr-x    2 root     root             0 Oct 13 10:51 power
--w-------    1 root     root          4096 Oct 13 10:51 remove
lrwxrwxrwx    1 root     root             0 Oct 13 10:51 subsystem ->
../../../../../../../bus/peci
-rw-r--r--    1 root     root          4096 Oct 13 10:51 uevent
root@bmc:/sys/bus/peci# ls -l devices/0-31/
lrwxrwxrwx    1 root     root             0 Oct 13 10:51 driver ->
../../../../../../../bus/peci/drivers/peci-cpu
drwxr-xr-x    4 root     root             0 Oct 13 10:51
peci_cpu.cputemp.emr.49
drwxr-xr-x    4 root     root             0 Oct 13 10:51
peci_cpu.dimmtemp.emr.49
drwxr-xr-x    2 root     root             0 Oct 13 10:51 power
--w-------    1 root     root          4096 Oct 13 10:51 remove
lrwxrwxrwx    1 root     root             0 Oct 13 10:51 subsystem ->
../../../../../../../bus/peci
-rw-r--r--    1 root     root          4096 Oct 13 10:51 uevent

root@bmc:/sys/class/hwmon/hwmon3# ls
device        of_node       subsystem     temp11_input  temp11_max  =20
temp13_input  temp13_max    temp15_input  temp15_max    temp1_input =20
temp1_max     temp3_input   temp3_max     temp5_input   temp5_max   =20
temp7_input   temp7_max     temp9_input   temp9_max
name          power         temp11_crit   temp11_label  temp13_crit =20
temp13_label  temp15_crit   temp15_label  temp1_crit    temp1_label =20
temp3_crit    temp3_label   temp5_crit    temp5_label   temp7_crit  =20
temp7_label   temp9_crit    temp9_label   uevent

root@bmc:/sys/class/hwmon/hwmon5# ls
device        of_node       subsystem     temp11_input  temp11_max  =20
temp13_input  temp13_max    temp15_input  temp15_max    temp1_input =20
temp1_max     temp3_input   temp3_max     temp5_input   temp5_max   =20
temp7_input   temp7_max     temp9_input   temp9_max
name          power         temp11_crit   temp11_label  temp13_crit =20
temp13_label  temp15_crit   temp15_label  temp1_crit    temp1_label =20
temp3_crit    temp3_label   temp5_crit    temp5_label   temp7_crit  =20
temp7_label   temp9_crit    temp9_label   uevent

root@bmc:/sys/class/hwmon/hwmon3# cat temp*
95000
35000
DIMM F1
93000
95000
35000
DIMM G1
93000
95000
34000
DIMM H1
93000
95000
35000
DIMM A1
93000
95000
36000
DIMM B1
93000
95000
36000
DIMM C1
93000
95000
36000
DIMM D1
93000
95000
36000

root@bmc:/sys/class/hwmon/hwmon5# cat temp*
95000
34000
DIMM F1
93000
95000
34000
DIMM G1
93000
95000
35000
DIMM H1
93000
95000
36000
DIMM A1
93000
95000
35000
DIMM B1
93000
95000
35000
DIMM C1
93000
95000
35000
DIMM D1
93000
95000
35000
DIMM E1
93000

Values around ~35 is temp*_input and thresholds as 93,95 for max and
crit temepratures plus temp*_label.

Guenter, I saw that you already applied other two patches, need I
resubmit series with updated info of commit for this one or just this
one?
>=20
