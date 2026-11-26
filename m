Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795693040;
	b=NobAw/1SVV8c+Z4gBO/bpIqfBGIMd6q3pqDxC2dqi8OzmcYgbkPD8HVsUAxuej3X4RoQ
	 2FOPl+iCVeNszQHgCYGdTyVhXuoQucuexY22vGJSecMDlhIFkHzkyHWXKQveJKnKj9DO3
	 0DZ0ZJPGYeUp65rAFyzWtdxEVHGclCarT5svT+nVPFl75pzyHqC31PZquw7Q4KU2vk4Nw
	 UWeD6AsMC9QQEPE69fNkxTWN3btFAC5wCSR9kGAQ3edaR+oj4MYPJ8/0uTrcSZfVkvfx4
	 DAq7zjv3jufr+TbqMTC6RX/JDwa/AECQY35C7uI7InWeESk4Qdn2TdTo7RsXqf1bafA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=/xyLrXS2X/qTHo5Uhw3eO/ZqcX+RwxYgIHco5H6oqBk=;
	b=llDD8eYbnFGOOuAaB02bW1jx9U6GtZsbd02MZhC+uk/qh5lr6uabTUSEmjiozyd0vAEB
	 HL/e8wHhZ374pNTTxja2rosywmrI2L+RigcR3v09QUQmv/9U7CCER2DFe8miKHopz76B6
	 NSGzsuUn8elF+l2Fd+X3E4IQ2XGAXIYi0C0mrSciR4WAdcC92QP2wTYhJqF1CABajKIjt
	 TZ+Lc7+VCkKWeVhEDXqUi3WSXORf5xto0F8B8pWTZ7OG0EFi8BZUI7UL3/+hd8IYHCtve
	 Z4yl3s+Zq+0P0WeKkv5K7m7e7Q4HJBnPq3Cxd1khHT/VzrSDcRcn722OjigOKpnb0dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gzaaxDwW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE383606A333
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 11:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE383606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gzaaxDwW
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-55c35262674so52055381cf.0
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 03:37:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795693039; cv=none;
        d=google.com; s=arc-20260327;
        b=EUyBcbOY9ireXR8c3LtJKZfun0dgzanWNE6kvt+D5x9QqfEdFrhciKU2YHuXc8tOuc
         xxoW0zsEf64R/bQYiywE+Qd4WPpQ03jSKIe4lLBSmRnrSyR7g15jdME1dqiKeKH6SRME
         ituI/+2UB1lMeWbGpuC3pC38kocJwINCCgn8xpxxKwBtA2MeqSeO+jRNIIaIupUTe9co
         ZSsCXtUBKxfM+lGmiCGxcBYjprflm7LcYhuNP1eM03V0ZR4WGtZpFTkdW09W57hPFKyC
         AwlrctttaEk5xKZb/7JfRr66OzU6lFl22Nq2IpMHsmXsXG6b5CFpCV3z3OtbGkDol/bQ
         xteg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/xyLrXS2X/qTHo5Uhw3eO/ZqcX+RwxYgIHco5H6oqBk=;
        fh=0C/NacxPb8rIaU32p77Pdl7otf8ET0q++Gp87p+c9qI=;
        b=qU5zDwLCyhnQyoGXXFKsvXYa8Diyto921IsF+puVhsDtSvWbz58sSqWvIGGTBkSueF
         MUtKp9TSvz4WxGmWzS9P1jGUWGyahjHGl9btRXnOvaYhBJPkAdqCvsC5oMlQ6QxX9s7i
         HrOmCbbU8SoqfBmtkDRUsXzTEB7dyXV5/aV0pEZvcntjY+TL5ctFYTW4zznjqZZ4b6xy
         FI+Znic6dTYsIcNRkrr67LaPFJIqUeYPjNIcCv2jbJXFtsIjD1dYsTf0mau+iGvCC3gS
         Eyyel7akcSDRxsNMopfyFdWOCNuuDYWohwFu3Wfpcnq4HuWMdey37MGZkGboCktFFsYo
         19tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795693039; x=1796297839; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/xyLrXS2X/qTHo5Uhw3eO/ZqcX+RwxYgIHco5H6oqBk=;
        b=gzaaxDwW0DYZolHA178uM5pCvkaGKauz9fPD7c9YSPE6R/gAucBSvLOleEd+lTOBiI
         6zqR1W+bIGe5aO77mBGXoZQ9X+QUUzlbtCm2VjN3UkTZgioXlyFsUa1dCqKbplqUG+Ft
         sE776u8jA8gxe+WDI0DlUF/DykHvkKTZQVqFVKTZoo7N03+SDT2b8WzLnYbqFPoTa9eS
         XdBUUO/rY7RD/Rc4kKilhTKxv5HaDH0cwuWz1MVXmeBdGgXFmNckF9fLaCglqLkkpZNv
         DdfeXlmUTwceCQ10Ach96w2Xwf4vcC0UHarttFfoLpCc8UDrJBxOV+54kVWIMQClt1w4
         +/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693039; x=1796297839;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/xyLrXS2X/qTHo5Uhw3eO/ZqcX+RwxYgIHco5H6oqBk=;
        b=xqJkbNnH4pTR+ZfAgE/0bEvHpVN/dnyQoTwGfMOD1WpAg+fjejGfXeewG8LLM5krMt
         ELbo5ODHuXwhsmzHZFuqWphO/DUKvtLrJad4xQWh6XknAqSRU2QvPgPxN8a7AJVvT0ir
         078r3VCQqBqmHhEPY2/y3EfRpLaWC0iZyyTQMghQBSv+rLgRRUf1j6kF3qaZ1aMTh9R8
         TeD1HMJJ4dqWiBAZXvZvrafPttNp7QwNI/rSUa+8Ei2GWc2DQFrQFyvQmwRjTAMNSZvk
         Afw6nkhtWkrBO/Svi5ODm17gLOTI9B7tsBATlP7w/lYQp1Vubst/HbSWDiGouWShw1EF
         qs/Q==
X-Gm-Message-State: APuU4Z/Nyog4I45cenPmr/n7ybztaqqXFaKe8JO8A/JZT9cA/T6fUmXw
	ZEZ6zLzNnrtbKXUNJl0bQGK/yvQBtmWAonuMTez7gpDCFRbwQ0eh/4BCQ9HpZpcnBGN3UxQoPon
	/SmjuIpucVhQPD2gKAKYcx2zY4WoXZUnzpw==
X-Gm-Gg: AZFdTZfZdcCJgnjjXM1jyWx7mTn5jQnbVsZGxoieWRMYXO296rPOvk3sdIab5LNNKaH
	jTwxDNxaVKY3M6M7NEUu123QzSY0Muk6yyQJoaGFB3zDWn92LrZKNbDnLpTx21/NINkub4aMDT0
	CndjLZZyhsv21HF74ZaGSpo3d8PnGVAWgpc+jeCFhdBlQ3w+HiLSXpC3WibI9v4hbTPExku03l9
	4bIf4VCU9kZK/obslmXUGABrhTqgVJOWPa0Zfhpm6rRcwlSrpc0vdw7jvslDIDzBiAZIIgXCQeD
	GbC4hvpG8zgryLSI/B0tGUv4f7acNcnJx24Xj9jMjXNQcIW5qoVxSDI9cFqxzLK5Vd48x8an7tE
	nTMohVab6vB5VcZIED3L8QGp7+eodCpb7yjSTBa7hTy2mUo647fAumN5AVCc=
X-Received: by 2002:a05:622a:4c8c:b0:55c:c52a:d08d with SMTP id
 d75a77b69052e-55d769f85b9mr367247321cf.42.1795693038688; Thu, 26 Nov 2026
 03:37:18 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 11:37:18 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: jdenheijer74@gmail.com
Date: Thu, 26 Nov 2026 11:37:18 +0000
X-Gm-Features: Aa3M54qrBv8_Gv88yVY54Jy8mOwylortfuOEBZkfx-3hky8IxIGMKSK1B9fkRU8
Message-ID: <CAP-m2G6VwPqTOZ_uQEAsWnb=j4yFj+_N0V33gOTL5kRYwwYbvg@mail.gmail.com>
Subject: [RFC PATCH 0/3] hwmon: asus-ec-sensors: MAXIMUS XI HERO Fan Extension Card
To: linux-hwmon@vger.kernel.org
Cc: eugene.shalygin@gmail.com, linux@roeck-us.net
Content-Type: text/plain; charset="UTF-8"

This is a request for design and safety feedback, not a request to merge
the series as-is. It adds opt-in monitoring of the three fan tachometers
and three thermistors on an ASUS Fan Extension Card attached to a ROG
MAXIMUS XI HERO (non-WiFi), BIOS 2004.

The pinned base is Guenter Roeck's hwmon-next at
12c53b6b6e5ac3723b49de3e4ea0742200d06d05. It already contains the
MAXIMUS IX EXTREME selector-based extension fan path and EC 00:60..62
temperature descriptors, but does not select these sensors on XI HERO.

The BIOS 2004 image (SHA-256
034e6c688ca41cf448745398ce3ccfa184dfae217287ee7b72039498ff5aa812)
provides the following property and transaction evidence:

  EXT_FAN1/2/3: properties 0x060400e2/e3/e4; write EC 00:43 with
  selector 0x0a/0x0b/0x0c, then read high/low RPM bytes at 00:57/58.
  The getter checks EC 00:d4 on every call and performs first-use or
  lost-latch read-modify-writes d4 |= 0x80 and 89 |= 0x07.

  EXT_Sensor1/2/3: properties 0x06030032/34/36; after a firmware card
  property check, write EC 00:68 = 0x07 immediately before each read
  of 00:60/61/62. The exact meaning of 0x68 is not established.

BIOS 2203 has the same relevant fan mapping and getter control flow.
The BIOS presence property, IsEXTFanCardExist (0x06060050), reads the
EXTFanCard UEFI/Setup variable; we have not established a reliable live
electrical card-presence signal. Accordingly, the XI HERO extension
sensors remain disabled by default and are enabled only by an explicit
module parameter on the exact non-WiFi DMI name. The WiFi entry is not
changed. With the option enabled, the first read of any hwmon input may
trigger a full refresh and the extension setup writes, even if the user
did not request an EXT_* attribute.

Patch 1 changes generic EC/selector error propagation so a failed block
read cannot publish a partial sensor cache. This affects failure paths
on all supported boards, not only XI HERO. Patches 2 and 3 add the board
opt-in, RPM path and thermistor path. Patch 2 currently relies on the
restore/error path introduced by patch 1; we would rebase or reshape the
series if the generic change should be reviewed separately.

The new transactions use the driver's configured ACPI EC mutex, normally
\AMW0.ASMX on XI HERO. They do not add PWM, fan-control, NCT, direct
EC-port or WMI accesses. They do write the EC bank selector, the BIOS
observed d4/89 setup registers, the fan selector and 0x68. We do not
claim that these writes are harmless when the optional card is absent.

A different, locally maintained asus-ec-sensors module for Unraid 7.4.1
/ 6.18.64-Unraid has returned all six channels on a physical XI HERO
with the card installed, including after one reboot. The binaries and
some error/selector handling differ; that test is not a runtime test of
this upstream RFC. For this RFC, x86_64 and i386 objects compile with
W=1, an x86_64 module links with modpost without diagnostics, and a
static comparison of 66 DMI names finds no default sensor-mask, family,
mutex or existing-descriptor change. We have not tested this RFC on
other boards or with the card absent.

Questions for maintainers:

1. Is a default-off, exact-DMI opt-in acceptable when firmware exposes
   only a Setup-variable-backed card property, or is another presence
   mechanism required before these EC writes can be accepted?
2. Should the driver preserve the BIOS first-use d4/89 writes even when
   d4 bit 7 is already set? We have not isolated their necessity and do
   not want to replace a working BIOS sequence with an untested shortcut.
3. Is reproducing the BIOS's 68=07 write before every thermistor read an
   acceptable basis while its bit semantics remain unknown? A separate
   BIOS Extension control initialization path also writes 68=07.
4. Would you prefer patch 1 as a separate bugfix before the board support,
   and what fault-path regression evidence would be useful?
5. Is the separate non-WiFi board profile and module parameter an
   appropriate interface, or should the board/card policy be expressed
   differently?

The series is intentionally an RFC. The three patches carry the
submitter-confirmed DCO sign-off. We welcome review of the card-presence
policy, register transactions and generic error handling before any
attempt to merge.


John den Heijer (3):
  hwmon: (asus-ec-sensors) propagate EC read and selector errors
  hwmon: (asus-ec-sensors) add opt-in MAXIMUS XI HERO EXT fan RPM
  hwmon: (asus-ec-sensors) add MAXIMUS XI HERO EXT thermistors

 drivers/hwmon/asus-ec-sensors.c | 140 ++++++++++++++++++++++++++++----
 1 file changed, 122 insertions(+), 18 deletions(-)


base-commit: 12c53b6b6e5ac3723b49de3e4ea0742200d06d05
-- 
2.53.0
