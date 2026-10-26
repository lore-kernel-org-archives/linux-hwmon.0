Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793005068;
	b=ag3hE673z4Om9DkqYOPrQ8Wr1GP0kG3OXC4iM4a0lx5luQBeyzs9krWgsWJFC3FlExxX
	 KnQY2cSP3etfGASpilEPUmPT6foY477MCz2RvA0N18nYVqgTzzwSLjW/Xd8ZcwGDJKvYb
	 0U7okEfvTTc4wWfIWdghCXxyb6n2kSRBlfyo3NOXHLT7Lto/5TG68fUFQmneFg7qEG26p
	 VaetXEHtradrs44nd6J/PX26NBhMLmuLgfRfa+Znk3LEK5pcqEjZDF42+yEUDRVyUQKsa
	 xHPn86IU3qriaVNdApjTtUuOrLI338SeLmqRV57rNiUUP6ZZioGy/RIdHhLjuGHWGsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005068;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=PtcrhzNLRZtn8LcDhHAc+8VmItc/hVjttL6zxWM1wRg=;
	b=sn+tVh+yyGEgISbwVy9SRVIRMJlzAvAW/rEL/WoOpPnq0P8Mq7mDh/5NDN9GN7Orcrzl
	 eD3LawYZgL6IxBiF9ZgwrMIMTbEEyXB74qJ4NWhWnKxvAYgryDllZDnwx/dARVEl+SFwO
	 LvutCh3CkSzvbIjOrsM6EqlmabHsYsxTJILYyZY5IIw1Z0q3GO+gU10TF8JNwmzqk7rBZ
	 mC2AB8Nklujp18IwKnstXWA03xeTOkaVYNAUbBMUjTCjyztSjs2WvjzAKmot1LTqj4468
	 hIkG/OHizyZGLoVvg8cLmIw/zSOe8aDTkiMiXZ9t1mprpoUHaGVp4iJnkKDfsDbTsYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dloRwrIU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4F7606A31A;
	Mon, 26 Oct 2026 08:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dloRwrIU
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793005068;
	b=r2o2eoPkDg/BBRaCgSVj4SocxehnW6JBTSOO93cjC375xTM59YC0NrMooTIk13ygz5Fd
	 d7IOkJkrWU1l6kLA1n2s6aQdYAn9UOx9hmaSlcuxdx++UOq0BBqtFynFI994droEP8khP
	 VIBk2pNf3x/pXnKmbhW5Wp3X10BrFJWjDVs5alz7bFnCbHpJqFtvWuaz9HnLLihLVKeJV
	 eEbydRDKQRXkq4nlROghi5frDO4CuamdiIbjs/iuH2N/t0twyAtPc2y2cfEI37L/FzE9z
	 o73AH5K6hJ1Sx/jduqGxGXLyLqb7qFveFSwcCalknx4RsssCx3LZ/He90GdeRy4P//w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793005068;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=PtcrhzNLRZtn8LcDhHAc+8VmItc/hVjttL6zxWM1wRg=;
	b=oUOssXqJVbEbJy2v5v4t1+cE9PnhuhFDT6I2WNuE/7B5T5gaami8XJFAYY+1V3ghhwrD
	 fhMV1zco1B5tmoDOi011luYV7szVSh2N5hBeQe5LZTgxMOEf9wsWOReYojZg9Wirlig01
	 pFMBLo2WP0sSdx8Epmo93VoNkkXVi9bw8quM+iaihaHWdvtK7WESocam17Q6XQERfrvYp
	 6f7gUoEoTNTW0keMGXDuAxBRsv5VBMgjvl8Geek4fv6YTSeKTG4sT/WxTMpE3+/YpFis6
	 pib4J/tnCTA7pWbPJ5RaCCvRIW3CKPM51IapRZzZhUJm3iR7rhjEm8YPSJAYCb7Q5wg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A4B0D1F031E0;
	Mon, 26 Oct 2026 08:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793005068;
	bh=PtcrhzNLRZtn8LcDhHAc+8VmItc/hVjttL6zxWM1wRg=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=dloRwrIUDpNxGsxubehH/1CjwdxhhFwEjvq48NlHjQ0+QWd9F1YZDobPuGOG9HmCF
	 lgLSFOuYDPKKsCDAIIWQfw+ASGP7iFvfkqsCkTVKU2H4DUSsGn3GPLAIl5d/mNUt0z
	 ej8BVd9W5k+Ic3kPBKUZ32kplX8aUP1S0MRpHO24CeCMPVdGHJJQsE0PY4+RDosiCh
	 LI+HTgnM/qrmHxIcM7HXKI5PAwRdGz7+gKV6NF9V8wshAFL2xA3U3Xv5lnr06DBxHi
	 lXo0TkGcoberKg9t1o/I198IiUmLWDjQI5Pz5LQ+J3+wfqW3STqwOO6hq28zQ959Ic
	 yY/WikYk7NOVQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F3F4C44C83;
	Mon, 26 Oct 2026 08:57:46 +0000 (UTC)
From: Remy Demangeot via B4 Relay <devnull+remy.demangeot.net@kernel.org>
Subject: [PATCH 0/3] hwmon: (asus-ec-sensors) more MAXIMUS IX EXTREME
 sensors
Date: Mon, 26 Oct 2026 09:57:34 +0100
Message-Id: <20261026-b4-m9e-ext-sensors-v1-0-644d389b2de1@demangeot.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP4V32oC/1WOy27CMBREfyXyurfyI06cCCH+A7HwY2i9cNLaB
 iEh/h1DNu3iLs5IM+feWUGOKGzu7izjGktclwbio2P+2y5foBgaM8nlINqR6ylNINwqFSxlzYX
 UxGEUjBmnwFrxJ+Mcb+/R42njjN9L265b+C+hhFLsWzR3u80j9B9PRgJdBQkapAh2kgJK8kNAe
 v231s8Fdf/yOltAfk0p1rmDcMrLQfGgnXF+1PqM3lkzBMkDN35UPZzmPTs9Hk+IzYzmBgEAAA=
 =
X-Change-ID: 20261026-b4-m9e-ext-sensors-390e83e8879d
To: Eugene Shalygin <eugene.shalygin@gmail.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Remy Demangeot <remy@demangeot.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793005066; l=2835;
 i=remy@demangeot.net; s=20261015; h=from:subject:message-id;
 bh=zn8DXKlaE4UvmTPoDcyez0qpguM1Sh9lNNufMZLHhXU=;
 b=/If33aB3oe4ancoLuekn6b85La6zjisVvdKxW3O5dP1i/D9Iz7HJ+4t5gok6QzVKJSbcdMCdr
 Upgx4aayxCwBsQ+ov+wLaiI1V5v1dwnEiqv6/UVtEcq2VzuVpSIwU2n
X-Developer-Key: i=remy@demangeot.net; a=ed25519;
 pk=h/s5N2ZlgZ0m+8FpMhSaCNJt0jvb9whRBAdJwpC+VAo=
X-Endpoint-Received: by B4 Relay for remy@demangeot.net/20261015 with
 auth_id=1194
X-Original-From: Remy Demangeot <remy@demangeot.net>
Reply-To: remy@demangeot.net

This series adds the remaining sensors of the MAXIMUS IX EXTREME EC
that HWiNFO reads. It applies on top of "hwmon: (asus-ec-sensors) add
MAXIMUS IX EXTREME", which Guenter applied:
https://lore.kernel.org/r/20261015-b4-m9e-extreme-v1-1-621da921e320@demangeot.net

Guenter asked why I assumed these might not be acceptable. No
particular reason: two of them need access patterns the driver does
not have yet (a selector register written before the read, and a
second EC on its own I/O ports), so I preferred to ask before touching
the read path.

 1/3: EXT_Sensor1-3, plain reads at bank 0, 0x60-0x62.
 2/3: EXT_FAN1-3 speeds, read after writing the fan number to the
      selector register 0x43, which is restored afterwards.
 3/3: the four water temperatures, on a second EC at I/O ports
      0x68/0x6c, bank 1.

Notes:
 - After 3/3, enum ec_sensors has 32 entries, which fills the
   unsigned long sensor mask on 32-bit builds. Any further sensor
   will need a wider mask (u64 and BIT_ULL()). I can send that as a
   preparatory patch if you prefer.
 - asus_ec2_wait() polls with udelay(10). checkpatch suggests
   usleep_range(), but the EC normally answers within a few
   microseconds, so I kept udelay(). Happy to change it.

A related question, independent of this series. The EC also holds the
fan curves of the extension card fans: after selecting a fan through
0x43, registers 0x4a-0x4f hold a 3-point curve (temperature in degrees
Celsius, duty 0-255) that the BIOS writes at boot. Writing these
registers changes the fan speed immediately, and writing the same duty
at the three points gives a fixed speed. My out-of-tree driver uses
this to expose pwmN and pwmN_enable (1: fixed duty through a flat
curve, 2: BIOS curve, saved at probe and restored at unload and
shutdown, and re-applied after resume), so that these fans can be
driven from userspace like the Super I/O ones.

Would write support like this be acceptable in asus-ec-sensors, or is
it better kept out of tree or in a separate driver? I understand the
driver is read-only by design, so "no" is a fine answer.

Tested on the MAXIMUS IX EXTREME (BIOS 1501): readings match HWiNFO
8.54 and the out-of-tree driver on the same machine.

---
Remy Demangeot (3):
      hwmon: (asus-ec-sensors) add EXT_Sensor temperatures for MAXIMUS IX EXTREME
      hwmon: (asus-ec-sensors) add fan extension card fans for MAXIMUS IX EXTREME
      hwmon: (asus-ec-sensors) add water temperatures for MAXIMUS IX EXTREME

 drivers/hwmon/asus-ec-sensors.c | 219 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 205 insertions(+), 14 deletions(-)
---
base-commit: e1b3c2630d5b8bc755fe4ba86d20d08c734eb504
change-id: 20261026-b4-m9e-ext-sensors-390e83e8879d

Best regards,
-- 
Remy Demangeot <remy@demangeot.net>


