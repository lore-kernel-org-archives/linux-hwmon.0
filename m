Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795334868;
	b=hTVHxVeWsN3N2s9minMFNIra5Nn1DNvcGEThsdWMaOxqnyWJGS7JBO7CjsHzcD5Ys1qV
	 iRiYLjUaRKwk35YyL1CeC5yBSwGvECKJBltecq6IMnA8wt6CZjLF3No/toXVk0WmjaXKj
	 4YnMkUHx1YlFgd0G50fooZdlY+uzktcBifJPS2VAzE4xotmzRat2hIcrDN17+UomX2ej9
	 K9Unfgt011CC6yVFeKOEyk1oHE5beOP4OgT/N2rb99gUiDY5hH59Bi2b3yY2C+rVKNbm1
	 4zXmkNL7BEuyTtsNq20G0XDoNiY3ZLgCfDstdV/1z1BcW2nCGK2sL9mylQYLvB03BKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795334868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:MIME-Version:Date:From:
	 To:Subject:Message-ID:Content-Type;
	bh=ds5sM5Um9iVNEg99oCxyD37ZA4KAotb87sG7O8Myq9U=;
	b=z2uDbFkjLJy3FqU+sC20Yk1WHFBwcstIiN2hZ00y3T1IxS0Mu59gZotu7ow8+sPj/avG
	 iQb9mdiXO5DkdjnlnsdlCQxUyX/Mbt4Aq7kQVliLCVwPRcyEnpvjl7Os4IkAdb/Wcn3eh
	 U6lI3wSjRMwI7KyhrWy11Q5ipEd9IcrJVH181NPBR2Xxpu3m6wX3uKaWT/RZQQJRhjfnh
	 3oOshbZmaOQBTX7XuoOe2eVpFewVHHi8QnaVv7/meHxXWzTghS7DC2L3P73hwMTKg5lC3
	 Dg3N9KG9M63sT448yy6zEHmUCCuUFxdKqYpOm4cEsoS08T1qzYPXPckUSeC+KHe8acw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=posteo.de;
	spf=pass smtp.mailfrom=posteo.de;
	dkim=pass header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256 header.s=1984.8680eb header.b=OqRGesbL;
	arc=none smtp.remote-ip=185.67.36.66
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B49B606A339
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 08:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B49B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256 header.s=1984.8680eb header.b=OqRGesbL
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 3ED64240101
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 09:07:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de;
	s=1984.8680eb; t=1795334859;
	bh=ds5sM5Um9iVNEg99oCxyD37ZA4KAotb87sG7O8Myq9U=;
	h=MIME-Version:Date:From:To:Subject:Message-ID:Content-Type:From;
	b=OqRGesbLHDgCDcORTbk9P2z8N9qK9hzwHKj04vC4Ii63ckooI3S5ci34I48sIvlL7
	 TZa/nKfomYAD+r7CttdEq4Qlni+SjLL5+7+Pi+pgGiqRZQ6GX84hSz3br5GnvRtk1v
	 FVh9yZUoMup/uuFxNz9VheWPm9h0GNpkVIO+QzQLha+jPqYZvj/a0z/EJ9zZm8Vtuz
	 R7rbMnK0RED5jxHJxs4rS4omORdEE81SB4xXskgbjNMyLE39t05mZF4YXwu/Gl3Feq
	 OJ2f18T0vi8IauDdq3zehcx4+xnf6y9F8TYcJS9kSNroiByYkzG+Ov+KruDv5MoSvx
	 TNqrkh53P+TZg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jXMBL6KFrz9rxD
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 09:07:38 +0100 (CET)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 08:07:39 +0000
From: meikkalkowski@posteo.de
To: linux-hwmon@vger.kernel.org
Subject: hwmon: =?UTF-8?Q?=28aquacomputer=5Fd=35next=29=20aquaero=20no=20l?=
 =?UTF-8?Q?onger=20registers=20hwmon=20device=20on=20=37=2E=33=2E=35?=
Message-ID: <bf51db98b71a8106cc562f4c4fb1a23c@posteo.de>
Content-Type: multipart/mixed;
 boundary="=_bc8174d2456d8341feb71620a331aea5"

--=_bc8174d2456d8341feb71620a331aea5
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed

Hi.

Since i installed the last kernel update, i recognized that the sensors 
of my aquaero doesn't show up.
Because i'm an unexperienced beginner in linux and still learning, i got 
some help from an ai. This is the output after solving my issue:

Since updating from 7.3.4 to 7.3.5 (CachyOS), my Aquaero (0c70:f001, 
bcdDevice 0.02) is bound by aquacomputer_d5next on all three HID 
interfaces, but no hwmon device is created and nothing is logged. On 
7.3.4 / LTS it works as expected.
Possibly related to the recent change adding the maxcollection check to 
Aquaero detection.

dmesg:

[    1.655267] usb 8-12: Product: aquaero
[    1.655269] usb 8-12: Manufacturer: Aqua Computer GmbH & Co. KG
[    1.687299] input: Aqua Computer GmbH & Co. KG aquaero Keyboard as 
/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:16:00.0/usb8/8-12/8-12:1.0/0003:0C70:F001.0004/input/input3
[    1.737511] input: Aqua Computer GmbH & Co. KG aquaero Mouse as 
/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:16:00.0/usb8/8-12/8-12:1.0/0003:0C70:F001.0004/input/input4
[    1.737588] hid-generic 0003:0C70:F001.0004: input,hidraw4: USB HID 
v1.11 Keyboard [Aqua Computer GmbH & Co. KG aquaero] on 
usb-0000:16:00.0-12/input0
[    1.748168] input: Aqua Computer GmbH & Co. KG aquaero Consumer 
Control as 
/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:16:00.0/usb8/8-12/8-12:1.1/0003:0C70:F001.0006/input/input6
[    1.798434] input: Aqua Computer GmbH & Co. KG aquaero System Control 
as 
/devices/pci0000:00/0000:00:02.1/0000:05:00.0/0000:06:0c.0/0000:16:00.0/usb8/8-12/8-12:1.1/0003:0C70:F001.0006/input/input7
[    1.798463] hid-generic 0003:0C70:F001.0006: input,hidraw5: USB HID 
v1.12 Device [Aqua Computer GmbH & Co. KG aquaero] on 
usb-0000:16:00.0-12/input1
[    1.811439] hid-generic 0003:0C70:F001.0007: hiddev99,hidraw6: USB 
HID v1.11 Device [Aqua Computer GmbH & Co. KG aquaero] on 
usb-0000:16:00.0-12/input2
[    5.794175] aquacomputer_d5next 0003:0C70:F001.0004: hidraw4: USB HID 
v1.11 Keyboard [Aqua Computer GmbH & Co. KG aquaero] on 
usb-0000:16:00.0-12/input0
[    5.931531] aquacomputer_d5next 0003:0C70:F001.0006: hidraw5: USB HID 
v1.12 Device [Aqua Computer GmbH & Co. KG aquaero] on 
usb-0000:16:00.0-12/input1
[    5.983618] aquacomputer_d5next 0003:0C70:F001.0007: hidraw5: USB HID 
v1.11 Device [Aqua Computer GmbH & Co. KG aquaero] on 
usb-0000:16:00.0-12/input2

I hope that helps to fix this issue in further releases.

Sincerely, Meik.


--=_bc8174d2456d8341feb71620a331aea5
Content-Transfer-Encoding: base64
Content-Type: text/plain;
 name=aquaero_rdesc.txt
Content-Disposition: attachment;
 filename=aquaero_rdesc.txt;
 size=676

MDAwMDAwMDA6IDA2MDAgZmYwOSAwMWExIDAxODUgMDExNSAwMDI2IGZmMDAgNzUwOCAgLi4uLi4u
Li4uLi4mLi51LgowMDAwMDAxMDogOTY4NiAwMzA5IDAxODEgMDI4NSAwMzE1IDAwMjYgZmYwMCA3
NTA4ICAuLi4uLi4uLi4uLiYuLnUuCjAwMDAwMDIwOiA5NjA3IDAwMDkgMDE4MSAwMjg1IDA0MTUg
MDAyNiBmZjAwIDc1MDggIC4uLi4uLi4uLi4uJi4udS4KMDAwMDAwMzA6IDk2NDEgMDgwOSAwMTkx
IDAyODUgMDYxNSAwMDI2IGZmMDAgNzUwOCAgLkEuLi4uLi4uLi4mLi51LgowMDAwMDA0MDogOTYw
NiAwMDA5IDAxOTEgMDI4NSAwNzE1IDAwMjYgZmYwMCA3NTA4ICAuLi4uLi4uLi4uLiYuLnUuCjAw
MDAwMDUwOiA5NjEwIDAwMDkgMDE5MSAwMjg1IDA4OTYgNDAwOCAwOTAwIGIyMDIgIC4uLi4uLi4u
Li5ALi4uLi4KMDAwMDAwNjA6IDAxODUgMGExNSAwMDI2IGZmMDAgNzUwOCA5NjFiIDAwMDkgMDE5
MSAgLi4uLi4mLi51Li4uLi4uLgowMDAwMDA3MDogMDI4NSAwYjk2IDkyMGEgMDkwMCBiMjAyIDAx
ODUgMDkxNSAwMDI2ICAuLi4uLi4uLi4uLi4uLi4mCjAwMDAwMDgwOiBmZjAwIDc1MDggOTYwZCAw
NDA5IDAxOTEgMDI4NSAwYzE1IDAwMjYgIC4udS4uLi4uLi4uLi4uLiYKMDAwMDAwOTA6IGZmMDAg
NzUwOCA5NjBkIDA0MDkgMDE4MSAwMmMwICAgICAgICAgICAgLi51Li4uLi4uLi4uCg==
--=_bc8174d2456d8341feb71620a331aea5--

