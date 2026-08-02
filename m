Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFEA1FBEA8;
	Sun,  2 Aug 2026 12:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785674888; cv=pass; b=t+fLNev6TlBji9/Yh/sZiCKFLh3z/9tVtd9MFxbPm1A/XlzGmjPHiENDAM/O4LgQg04NhjuXTmEi/awygK4eUJpr76EM4Zq70u5Gbw2JnZDvfpxuvNw3+MzgmhGcFf6/0GB8D67YyZu17hqrksuYumMtI4EolO+VbgmddVcIp+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785674888; c=relaxed/simple;
	bh=WobAaZ0g6QY3eB45gEG3Essr0H56lGxOJZvz0zP41ak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z7IryhPCrTdQQm0RqN998h8VHbksPnLJa8ZW8O8DfLpST2yI0MOJub52ozbNxa17l8SlRTTKxumJwavToAd/2RY+m1BcZsjIoM76kz4bo5J2KVdyjNH1Y5/1lEricrVGD2euQ1zJq9/pnUZL1H6czd0v2fW/EVZlOMz3lhBL4/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=X1fOMmUq; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="X1fOMmUq"
ARC-Seal: i=1; a=rsa-sha256; t=1785674863; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=GV8kDG/n5pDkSxva0AxR8tS14a4mjkysFanbXS8talPnHmm9xqe+OuRkcNe2S/3nZK2eWiJsKeIjQBUuljjeWyxnHBmiTAi6kFpEWueBufQZbR73dmPvsPURFSnxpcqsuA9Xd6LEpjkesLgzj2LcMIcc9XKV/rq3Cujf/oEYqIc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785674863; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AceY0HP18bSMJ8UJ8ZQUYyyRB+EPqmSqMGKy335dCvE=; 
	b=HiABIKmy5WDa1jfG131FN6q28bb+2BIFskW3YVkllpRknfDs9FRPx4Cwwn3EMwPNNxpdQjz+6+FNitEdOKvdE6w4AbYQZihhZvoIX848Yt1tsdFhbScH1/0jTbamjQVweX8sd3kptAHLn9Udm47QCSpVd9WiRqJdrctUwJgiJjw=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785674863;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=AceY0HP18bSMJ8UJ8ZQUYyyRB+EPqmSqMGKy335dCvE=;
	b=X1fOMmUqcHBQUu6shhum8viugMSS171CrsHG++fY4l8SSzO12AP0267o7QXfVadm
	G9rPuoDI72CSkJNj6wp309zTLTGYtGi178lIH02urJuq1bNazn8tK1JrdWrf4euuv1g
	B9PxMjkhMXDpp9RNFNZUDL2MfdxWguykEKwbExn0=
Received: by mx.zoho.eu with SMTPS id 1785674860305241.6541559953971;
	Sun, 2 Aug 2026 14:47:40 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: Ming Yu <tmyu0@nuvoton.com>
Cc: Ming Yu <a0282524688@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: nct6694-hwmon: temp17_enable and above write into the fan enable bitmap
Date: Sun,  2 Aug 2026 12:47:30 +0000
Message-ID: <20260802124730.20387-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi,

While reading nct6694-hwmon.c I ran into something that looks wrong, but
which way to fix it depends on the device protocol, so I would rather ask
than guess.

The driver registers 26 temperature channels, each with HWMON_T_ENABLE:

	HWMON_CHANNEL_INFO(temp,
			   NCT6694_HWMON_TEMP_CONFIG,	/* THR1 */
			   ...
			   NCT6694_HWMON_TEMP_CONFIG),	/* DTIN15 */

That is 5 THR plus 5 TDP plus 16 DTIN. The enable bitmap it indexes is
two bytes:

	struct __packed nct6694_hwmon_control {
		u8 vin_en[2];
		u8 tin_en[2];
		u8 fin_en[2];
		u8 pwm_en[2];
		u8 reserved1[40];
		u8 pwm_freq[10];
		u8 reserved2[6];
	};

and both the read and the write path index it with the raw channel:

	temp_en = data->hwmon_en.tin_en[channel / 8];
	...
	data->hwmon_en.tin_en[channel / 8] |= BIT(channel % 8);

nct6694_is_visible() returns 0644 for hwmon_temp_enable without looking
at the channel number, so all 26 are writable. Since the structure is
packed, channel 16 and above land past tin_en[]:

	channel  0-15 -> tin_en[0-1]
	channel 16-23 -> tin_en[2] == fin_en[0]
	channel 24-25 -> tin_en[3] == fin_en[1]

nct6694_hwmon_init() sends the whole control structure back to the
device, so writing temp17_enable through temp26_enable ends up toggling
the fan enable bits, and reading them reports fan state as temperature
state. It stays inside the structure, so this is not a memory safety
problem, but on a board using the fan channels it is not harmless.

What I cannot tell from here is which side is wrong, and the answers
need different patches:

 1. If the control block really has two bytes of tin_en, then only 16
    temperature channels can be enabled and the last ten should not
    advertise HWMON_T_ENABLE.

 2. If the device has four bytes of tin_en, the structure is wrong, and
    fin_en and pwm_en are being read and written at the wrong offsets as
    well.

 3. If the bitmap only covers the digital inputs, the indexing is wrong
    in a third way: there are exactly 16 DTIN channels, which is exactly
    what tin_en[2] holds, and they sit at channel 10 and above.

The structure is 64 bytes as declared, and it would still be 64 bytes
with tin_en[4] and reserved1[38], so the total size does not settle it.
Two things make me unsure rather than confident: the other three bitmaps
match their channel counts exactly, 16 in channels against vin_en[2] and
10 fan channels against fin_en[2], which argues for the first case; but
the 16 DTIN channels also match tin_en[2] exactly, which is what made me
think of the third. I could not find a public datasheet to settle it.

Ming, could you say which one it is? I am happy to write the patch once
I know, I just do not want to guess at the device side.

I have no NCT6694 hardware, so this is from reading the driver against
current mainline rather than from an observed misbehaviour.

Thanks,
Ali
