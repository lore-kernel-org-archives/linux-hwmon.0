Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417E21CF91
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Nov 2023 11:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ZKUFcwTJ"
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E17E6D6C
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Nov 2023 03:53:29 -0800 (PST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231113115328euoutp01bdd78606d47ae527e3f1b9fe8d96ec2b~XLJZPMAEs0163201632euoutp01d
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Nov 2023 11:53:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231113115328euoutp01bdd78606d47ae527e3f1b9fe8d96ec2b~XLJZPMAEs0163201632euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1699876408;
	bh=SJ636XENRBVKqcMBGxmurSV7+gQcnrcFhpYD2j7jO0M=;
	h=From:To:Cc:Subject:Date:References:From;
	b=ZKUFcwTJLdxfYiJa/ZxoVpje09AKXYMCUaozsujbpv+MGATm7rbhIMzPwyFK6PTOZ
	 LCizZy2TrZd5LshepVNPiLa/AmZm6wkYRWeLtynyX+lDShU1t6Wb8JLzgHuXdJ8G07
	 Wd/2JSfY/bsEjlEgjv+jaV9CTyRqEz/YcCANBlQ8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20231113115328eucas1p28cb55388eaac77661353605ac7f81743~XLJZH1j2O0481204812eucas1p2_
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Nov 2023 11:53:28 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id D6.80.09552.83E02556; Mon, 13
	Nov 2023 11:53:28 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20231113115327eucas1p11f84e775ce78deaa01557f3868c2f9dd~XLJY04wla1257812578eucas1p1M
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Nov 2023 11:53:27 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231113115327eusmtrp13d06f7ace73b91db71cf69d50cc08065~XLJY0dpai1997219972eusmtrp1L
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Nov 2023 11:53:27 +0000 (GMT)
X-AuditID: cbfec7f5-83dff70000002550-61-65520e38d09a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 4A.70.09146.73E02556; Mon, 13
	Nov 2023 11:53:27 +0000 (GMT)
Received: from localhost (unknown [106.120.51.111]) by eusmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20231113115327eusmtip166b9efd58ada5cb89c1d680d232cf93f~XLJYqe8pV1137911379eusmtip1X
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Nov 2023 11:53:27 +0000 (GMT)
From: Lukasz Stelmach <l.stelmach@samsung.com>
To: James Seo <james@equiv.tech>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: [BUG] hp-wmi-sensors: probe of 8F1F6435-9F42-42C8-BADC-0E9424F20C9A
 failed with error -22
Date: Fri, 27 Oct 2023 17:07:09 +0200
Message-ID: <oypijdmsw4f6jm.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
	protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOIsWRmVeSWpSXmKPExsWy7djP87oWfEGpBu//8lq0v97K6MDo8XmT
	XABjFJdNSmpOZllqkb5dAlfG9u4+5oJVPBXrLu5mb2A8xNXFyMkhIWAisXXmd5YuRi4OIYEV
	jBL/pr5gg3CmMUkse7MbypnKJPFm6ixmmJYHj+eygNhCAssZJba8NIYo6mKSODllAVCCg4NN
	QE9i7doIkBoRAQWJ1jkbGEFsZgFnibPz/oDNERZIkZj15AATiM0ioCrx/N0BsDivgLlEX/9O
	MFtUwFLi+NZ2Noi4oMTJmU9YIObkSsw8/4YRZK+EwEQOib//V7JCHOcisenhPnYIW1ji1fEt
	ULaMxOnJPSwQDe2MEk1XFrJCOBMYJT53NDFBVFlL3Dn3iw3kAwkBR4npf9QhTD6JG28FIRbz
	SUzaNp0ZIswr0dEmBNGoIrGufw8LhC0l0ftqBSOE7SGx889eaFjFSqw7PYl5AqP8LCTvzELy
	ziygqcwCmhLrd+lDhLUlli18zQxh20qsW/eeZQEj6ypG8dTS4tz01GLjvNRyveLE3OLSvHS9
	5PzcTYzA9HD63/GvOxhXvPqod4iRiYPxEKMKUPOjDasvMEqx5OXnpSqJ8OZpBqQK8aYkVlal
	FuXHF5XmpBYfYpTmYFES51VNkU8VEkhPLEnNTk0tSC2CyTJxcEo1MDkxyJ8qTAvRXNqQwLF2
	06mjrj1PbhgZNs/3rDvm+kw9Xub86XnR3xYu1GIulDI3XVujsMXqffykDB87y8sff/3bK5NX
	MZvv8Bn1I2t7u9QibFYtU5rx2eFgl1zEBq3dN0sXvp81ed7e/OmJXnN+Tza7EZM2rb8vXG0q
	U33QAY9Xl5O+Holx9CjlfPii7NA2f+O9DZs09kVW7olST1i6+/l9M77l/vvuluy4XbhExjR5
	skTj5ILbn+5trn2zdSFL3l4Wju3/feKCJYu0Lm36vO7YxbZE0TBXjT1b5s49uZzLiy2+NYy3
	NzNrtYcFV8Ps3UuX2JxWTn+1oOjOkavmyxX+mD7wXqNswPrynDXv3AglluKMREMt5qLiRADx
	rZ2ZigMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsVy+t/xu7rmfEGpBisnWli0v97K6MDo8XmT
	XABjlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7G
	9u4+5oJVPBXrLu5mb2A8xNXFyMkhIWAi8eDxXJYuRi4OIYGljBKXVj5j7GLkAEpISaycmw5R
	Iyzx51oXG0RNB5PEqVknmUBq2AT0JNaujQCpERFQkGids4ERxGYWcJY4O+8PM4gtLJAiMevJ
	ASYQm0VAVeL5uwNgcV4Bc4m+/p1gtqiApcTxre1sEHFBiZMzn7BAzMmW+Lr6OfMERr5ZSFKz
	kKRmAV3BLKApsX6XPkRYW2LZwtfMELatxLp171kWMLKuYhRJLS3OTc8tNtQrTswtLs1L10vO
	z93ECAzhbcd+bt7BOO/VR71DjEwcjIcYVYA6H21YfYFRiiUvPy9VSYQ3TzMgVYg3JbGyKrUo
	P76oNCe1+BCjKdA7E5mlRJPzgdGVVxJvaGZgamhiZmlgamlmrCTO61nQkSgkkJ5YkpqdmlqQ
	WgTTx8TBKdXApLdT8sNUZq9rTXNeHzvhrv9/dvIhxv0/U0/E9cW9Oba3jjvkx7Oq8CVF58NE
	7yYeOnDn54QXHdwzN2ZOXsU1uf2M/Rppu3Xee/d/O9f45MyGowutXseVmz68dOnNHHXBOXGh
	8+zzZFeGxz84oqC5eOOBW0bz+WbdDpZw0kyXSm3znZ1UJuUykTFdTlpwvoJ+q87Oh02VQlr8
	hxrW+1/O2vbIu39lR03BYd0r+h+ulcTaXNO766+2IOGB7M+C9bGcwSxvXzM/+M6h8re3K0kz
	ev/SKV+v9Z5YsUut+n3pM4NDzVfsqvWn37PZw7RiHuu6J/tDNq67e5sxu3LVrmUhOpe0zwec
	ns/Ftq3BoCU9eIkSS3FGoqEWc1FxIgDZgYtb9gIAAA==
X-CMS-MailID: 20231113115327eucas1p11f84e775ce78deaa01557f3868c2f9dd
X-Msg-Generator: CA
X-RootMTR: 20231113115327eucas1p11f84e775ce78deaa01557f3868c2f9dd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231113115327eucas1p11f84e775ce78deaa01557f3868c2f9dd
References: <CGME20231113115327eucas1p11f84e775ce78deaa01557f3868c2f9dd@eucas1p1.samsung.com>

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I've got HP EliteDesk 800 G6 Tower PC running Linux 6.1 from Debian=C2=A012.
I managed to build the hp-wmi-sensors out of tree. When I loaded it I
got EINVAL.

    hp-wmi-sensors: probe of 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed wi=
th error -22

I managed to track it down. And it happens in check_wobj() called from
check_platform_events_wobj() because in the for loop when prop=3D=3D0 the
type is ACPI_TYPE_BUFFER instead of ACPI_TYPE_STRING. When I bypass this
particular check like this

    if (prop =3D=3D 0 && type =3D=3D ACPI_TYPE_BUFFER)
            continue;

everything else works like charm and I can read senosrs via sysfs. I'd
like to perpare a proper patch, but I've got no idea how to do properly
work this quirk around. What are your suggestions?

Kind regards,
=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmU70h0ACgkQsK4enJil
gBBwiwf/Z0TVt+lKBIw2VMJl4rE0XWBWkusb14T+IAYu/xg+VRUUyGU7QO2CVvPI
jB9gKFk/zRhyNAK0MwvvyHryEmIKlYcS5OampPxDkqG+GbIgG8zb/SXvIUGxzVBc
q4/smXacXTa0Cev/UXOh1Y4Q5fYnSw2PMyki91/HR7cFMHZ53sb9RFQGWHhcluwe
3qdXLQbwY/kkVbNDdr8lfT6d6aZs1es5/vRoEayyDbN68BU/arnJzxN5wyjl8E2m
ekvT7HvpBulX19feI6NAjIN4+NNhf0fS8UHULdweK5jZrRR/cO6ruiWHXWRK1oBl
lA995stifCvUsOjTpqd8OJXsoz3hQQ==
=poOV
-----END PGP SIGNATURE-----
--=-=-=--
