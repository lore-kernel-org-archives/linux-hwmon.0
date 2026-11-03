Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.217
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793728995;
	b=XosxhStwBsAAasKjIaDyU7oUB3fcn0LJPortR8FMTxt74ZLzb7eJo3I9ugHmbuqnEz/9
	 Awi1RlJkESBLxR5m5GV7JzrLHSO4a5v/JM/Yq0udw3G0NzCT23zLbbovACgjGymYq/Wsb
	 pKpQstN2CTWWh8O8hF5tKjaRcLNDMd2AH1HM8gbpzEQh3JDGJ96mxSWqO/glShExm0iP0
	 P/ZJvAGa7YieYvEnEacP5xXaRyDK4iwPDsLED5GDOlcmyfaCQMEjkGH19/GA0DL+FFbId
	 +NBQqrp9WppLzcoSk6yKNxW1VZBDpFVZ1t89VsP80i+s0BcS6n07HU2H0ff4tsv0zzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728995;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Content-Transfer-Encoding:From:Mime-Version:
	 Date:Subject:Message-Id:Cc:To:X-Mailer;
	bh=lgXJwEi9GqbP3QtVrhfx1HWKhwHpmJhfsL0Sm8/umws=;
	b=cexHzryuA4f26pIFPyslHT9W8QgxATv/pgbg2LUfXCLWTCbV0HH444hd8hAz9MICzwKA
	 nb1PrCqzuX39XXXaWQxZCTAYSYF2qRuOuVCdKnz1Pa/lg9c6xZJQUOXBHguL/XlE1M4YV
	 Q+q9UsKjwRsRYvTGKoBOeB+9qsEqkxNm46vTNZgB9f7jJTQi9bW3jaCcSuZYdVjpJC1DK
	 JsfWOeLF4eqR8iq2MpvpJbDyng/dvKvGqjkc24aPmbyFloizY3cvuQkC6SO+7tsWpYpIh
	 EBMd8glnIbSHA2H2vDIIjF55iVEol+iMg/miN6xWy340gPKHVRA1Qbb03SiWIUHkp5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bambachmail.com;
	spf=none smtp.mailfrom=bambachmail.com;
	dkim=pass header.d=bambachmail.com header.i=@bambachmail.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=iIkBFFId;
	dkim=pass header.d=bambachmail.com header.i=@bambachmail.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=DlXIZ57u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.217
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CD7606D805
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 18:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1CD7606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bambachmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bambachmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bambachmail.com header.i=@bambachmail.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=iIkBFFId;
	dkim=pass header.d=bambachmail.com header.i=@bambachmail.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=DlXIZ57u
ARC-Seal: i=1; a=rsa-sha256; t=1793728978; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=HM9hUNvkcFxfagsBK2pHEz+7D4z1UwVds8AB2lrXMuX1H/SQrteWZasL3sREbWmpLs
    V9ZfJFxzdFZsd6hYECZQarrfEADvxXdHFNeNqwRjCpgpg4oC4ksv9k4ECMlgw8sgDIX0
    VLTXUzoAZb0UBRFloin7d0ydlJF+y1wEBdIsv8v3nugskkL+tRykLijFoxUUQuczd4GN
    dOPsgkGjmXxB4ZF6YLhWvGV4u2x6thKtDcn22D/YCX+RK1+StvfjqLt7fqaGrHUPbyLZ
    xTZnsS+P6a7owglqMYEmY/kg0k59BIazmTeq5lFGes0CDkoehUUkShn7o+sh3xm/13Lq
    gY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1793728978;
    s=strato-dkim-0002; d=strato.com;
    h=To:Cc:Message-Id:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=lgXJwEi9GqbP3QtVrhfx1HWKhwHpmJhfsL0Sm8/umws=;
    b=lGNEjSVzXbUhVqbVevQgyZGmu9lreVMpA0gRolqmJR7aZuHPSdrFCKibclByWboBDP
    0dT6GOGLhlB2MotYxASwhIm6vzyjVK+5S2vbJlbgd1+YPBGtOngeqKdZlRPcJ5BkQzKw
    8Y73YQtoxZ/88XqZXIYWQxGtpDms/tG1nEThOaVEe2LcMzDFnQhyDXns5NU6JHEgcnul
    5n+1ACczbKZ0JYSbXmh1pkyGWVs+8JTB2Btvy3PGoEU7zHjZvsxp4M2ZPj1FOsnlzrlb
    pRUpOHAePqZipd5uG/n3bc3XNsbgzdkw0hMNraynh+xowj4v0VpwUZL7JucAngvX4YJ/
    jx+g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793728978;
    s=strato-dkim-0002; d=bambachmail.com;
    h=To:Cc:Message-Id:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=lgXJwEi9GqbP3QtVrhfx1HWKhwHpmJhfsL0Sm8/umws=;
    b=iIkBFFIdgC4/mj393hvKlQpDYzpiDKBlS0MTBUtkyGDxZ2SGHpI1MOx2X8DCJbtcQH
    vTuNl5Q/B8LrdJVY5DcELScGV2Qp+LpztJDfMXmWPw+BLJclaKlEwvjqIHD7gnfuQzIL
    TxwGWjQVR8mK1SmBuiQ0VfmzYJelSnvveJ8reMFk3NVL3S5QQjEffsPyrtLDgffLsCuL
    1DnKxc727sz4+glkAeLmnSt50Z6/rQcu+HR+nXijFbPjnQml5DHvor2p7sv8BFMJ1YDx
    kzzVpLaNfnfYtb15dZXSIFBOMR6Dwg9yNdhr5xXj+ctl0zUj79XObvMTepl/4KflwQav
    tr6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793728978;
    s=strato-dkim-0003; d=bambachmail.com;
    h=To:Cc:Message-Id:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=lgXJwEi9GqbP3QtVrhfx1HWKhwHpmJhfsL0Sm8/umws=;
    b=DlXIZ57uKXJ12T++WrFq43Vfu3Xy/JD++8yfKg6lqOnyQS7ERpQaPLHcUczt0igyBf
    EHOFxenAv7mRQ7KgLKCA==
X-RZG-AUTH: ":LWIQek6Ief51lfXmPXdIJpSrlWnTPFVImQOrRyfCvoy+gfzfLagawA/WwozIZozHGjRCqge3j+UyM+bp8Dq27+mpbssFCrc0U3MgbeM1"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id wa09482A3I2vPY3
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 3 Nov 2026 19:02:57 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Anton Bambach <anton@bambachmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Date: Tue, 3 Nov 2026 19:02:57 +0100
Subject: it87: IT8613E on Biostar B760MX2-E PRO D4 - works; 3VSB reads ~half
Message-Id: <B9225026-A1AC-46A0-BEF4-50B74868D548@bambachmail.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, yahoo@perenite.com
To: linux-hwmon@vger.kernel.org
X-Mailer: iPhone Mail (23H30)

Hello,

I tested the IT8613E support from v7.4-rc1 on a Biostar B760MX2-E PRO D4
(BIOS 5.27, 09/11/2023). it87.c from v7.4-rc1 was built out-of-tree
against 7.2.11 (Fedora 44 based). The chip is detected at 0xa30,
revision 12. Loading needs ignore_resource_conflict=1 because ACPI
claims the I/O range.

Working:
- fan2/fan3 readings and pwm2/pwm3 manual control 
- temp1-3: temp3 tracks the CPU package temperature (coretemp) under
load, and the BIOS maps both pwm2 and pwm3 auto curves
to temp3 (pwmX_auto_channels_temp = 4). temp1 rises slightly with
CPU load (likely a socket/VRM thermistor), temp2 stays at ambient.
- writing limits works (in0/in1 min/max, temp1-3 min/max)
- Vbat 3.08 V, AVCC3 3.32 V

Two observations:
- in7 (3VSB) reads 1.56 V after the driver's x2 scaling, about half the
expected 3.3 V. I can't tell whether in7 is VSB on this chip or
whether the board wires it differently.
- The BIOS enables pwm5, but there is no fan5 tach input.

The remaining ALARMs on in2, in4, in5 and 3VSB come from limits the
BIOS never programs (min > max); I only set limits for in0, in1 and
temp1-3. intrusion0 is unconnected.

dmesg:
it87: Found IT8613E chip at 0xa30, revision 12
it87: Beeping is supported

sensors (no config):
it8613-isa-0a30
Adapter: ISA adapter
in0: 935.00 mV (min = +0.49 V, max = +1.50 V)
in1: 1.21 V (min = +1.14 V, max = +1.26 V)
in2: 2.05 V (min = +1.99 V, max = +0.75 V) ALARM
in4: 1.98 V (min = +0.03 V, max = +0.01 V) ALARM
in5: 2.06 V (min = +2.19 V, max = +0.22 V) ALARM
3VSB: 1.56 V (min = +3.43 V, max = +0.13 V) ALARM
Vbat: 3.08 V
+3.3V: 3.32 V
fan2: 783 RPM (min = 39 RPM)
fan3: 1054 RPM (min = 60 RPM)
temp1: +48.0 C (low = +0.0 C, high = +80.0 C) sensor = thermistor
temp2: +31.0 C (low = +0.0 C, high = +60.0 C) sensor = thermistor
temp3: +36.0 C (low = +0.0 C, high = +90.0 C)
intrusion0: ALARM

sysfs:
temp1_type:4
temp2_type:4
in0_input:935
in1_input:1210
in2_input:2035
in4_input:1980
in5_input:2057
in7_input:1562
in8_input:3080
in9_input:3322
pwm2_auto_channels_temp:4
pwm2_auto_point1_temp:10000
pwm2_auto_point2_temp:20000
pwm2_auto_point3_temp:80000
pwm2_auto_slope:6
pwm2_freq:23437
pwm3_auto_channels_temp:4
pwm3_auto_point1_temp:10000
pwm3_auto_point2_temp:20000
pwm3_auto_point3_temp:80000
pwm3_auto_slope:6
pwm3_freq:23437
pwm5:128
pwm5_auto_channels_temp:1
pwm5_auto_slope:0
pwm5_enable:1
pwm5_freq:23437


I hope this helps your development. 

Thank you very much for your work and kind regards,
Anton Bambach



