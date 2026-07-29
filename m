Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD78D32E141
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 15:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339783; cv=none; b=TosWjmGQ+lZr2S5n/t1+DfocQPxK3xwfugzZG8PI4RbJYNV/8+IOEzsAWiBNKupTRKuLA6lyLwCu4dmXWAnnFOu51s1NtpmQ9YRgnV5JgI9uJuS9UGRIHFmZ4AOaLGd+917IcowIdlx34L6028NjoOe/ynSnz6k2e48YHQkXLD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339783; c=relaxed/simple;
	bh=w9mDpTYu4ssoJnJ+HkcMVBmgvJ1qdCqNaAaVaYH1h7I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Nw6iMulqgyun2PiH5nVP1YyqHlP++g6O0beTLkRw25/XYUIzUrWUGLktofiGjDixIm80YGSxNDDksb7f6Tsxy3zdHLASd8Ek3edDzVjPotJxcp+u73tdEVvkYgqujLZlGzH9creCo4ptWJUlFZ9M/nxNIopPholhYj4Ukdo1Kow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mt9FD3p3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=k7jTYbFS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mt9FD3p3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="k7jTYbFS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785339781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0qSY6BWrUE0NLE71VBbO7Z4Al1DApQtmOZjsA5GEmE8=;
	b=Mt9FD3p3pHJAmc7YFwcagqhl5uEqMpRzx0leqdKjbK96C3J1TmDAoGibXcbS/1AFEdI4Kh
	dwhcXhUg6+He7kGjQy8SolvOsNWe94XgWaA7I8taOmKKTrkLQ5LXhqo8ldO3IPvjoRkHrK
	1KcxenQd9Gc8SLVR51/av3G1UZCCkww=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-chRCTsuiOjydl_F5b9XiUA-1; Wed, 29 Jul 2026 11:43:00 -0400
X-MC-Unique: chRCTsuiOjydl_F5b9XiUA-1
X-Mimecast-MFC-AGG-ID: chRCTsuiOjydl_F5b9XiUA_1785339780
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0408254aso94291cf.0
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 08:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785339780; x=1785944580; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0qSY6BWrUE0NLE71VBbO7Z4Al1DApQtmOZjsA5GEmE8=;
        b=k7jTYbFS8ROqerynujB1YOPmX9+yx/aZ8nwL/5HBnwqMFiLfQNW4z/jZOTxrdroXuJ
         4jADtnuNtuwmkdT8EPRZRonvjt618QnYG0nBa5N29uMmLTZfvOaT4Mzfyf05rKycARGn
         w6hIhzx6WKbLICrEuo39uydNHb3avgT+uLaaiuEE5n2CA8WfD/41SvtJ+PlD6Mek4uOM
         cf4Cj6cj1AO92cMsUP8ZhWrtl1Nb46MCfyrXBeWdvDAnh6x3o3l6SM81WJ94mzKC0Noy
         6IgyIHX4iz99sWRbnN6FuZOiFD39dLlAo1bQJj5t8wp2hW87G9HANLh6pbvRi7au8tr6
         551w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785339780; x=1785944580;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0qSY6BWrUE0NLE71VBbO7Z4Al1DApQtmOZjsA5GEmE8=;
        b=IGbZpH9h+jmnJarCSAiUWT8DLOLaeYZ/4fD+XnbTfBnANxMdxoUwfMoV6biiDQVRAZ
         5lgLCsI+NizgUHENby0CpTs3i0qKGnWqedvlI//QiTCB3QRiQ8SWeywEYtIbC3zBg/sq
         eEM/7EAnvFiVWWwbVMODQuWW6F39neftMfw6UOQ1G3axvCtuR/HgmwJZE+QeAM12pQ7h
         mK+PE09YyCn12wzILH1vVW07J9ipYZeRkhF08VeVgFYjPvathwsIC9OZCv65puoRXna9
         gaKyJUS1M1sENByUrAZzNxERvDc6sJntpBR5nJ2ckv9EOlrn8FYnlq2F+BmdIJrPuu7U
         nG9g==
X-Gm-Message-State: AOJu0YzxPrQ8jtwW/t2Bidn1m0UWEUDaGZUVVq58H/yMSCg/IahKQweV
	Fl0SoGh4keCvxTAf0PC+M8svyLDfUZ53s5ltqFIJXj/eIUzU7+Ov03twSJnClmqrscFhO2ZU77M
	3JBMwyy7FD2EZ4mYuZaZyOZ9d2eLgUETsJoc/be+g2XPmCI8DyO+VsyK3LiKJyfuLZ+WMxIYWZr
	UFvYmepvoOBrh2AqN3W+u2sRGyWdqtQWv90HXBVnv6bOic++I=
X-Gm-Gg: AR+sD12xjEk4gPkPW5D+22OF0W0Fs5YxH4Yda8xNl/mMRQvqvbBGp7wDSJlHw7t/vV5
	3ZocokYx8pjZjPv5c8u4vYjLv/XQlofHBWO2iLRmiJs4SoDKMRFv3eCku5SzTxrBK4hgXzzdeAH
	A1MRBNT//Np4ZAAOM0qH17vdqyzW9DPzPG2VYxdICkcamKjvY8zi9wDqO/xCzC32WrqbsQE1D3H
	tjE79SU7HUJk9DawIRZfNVIrQiG3wfG+XSfQcjFRFzotw76V3GE8aTckKZd+Ec+CYRQ+S8pyl4o
	GqsMtBky7yJ/GGivU1DjvMvR+mkkLzc5+axxn3ndm3rHc1Jds/h+9wat0D1X4T287U3qCaYzCna
	OdUs4I4leanb3gzorwUmukXKGbMDSKd7T
X-Received: by 2002:a05:622a:c83:b0:51c:a9a:b0f8 with SMTP id d75a77b69052e-52b2add4528mr25908371cf.29.1785339779822;
        Wed, 29 Jul 2026 08:42:59 -0700 (PDT)
X-Received: by 2002:a05:622a:c83:b0:51c:a9a:b0f8 with SMTP id d75a77b69052e-52b2add4528mr25907451cf.29.1785339778578;
        Wed, 29 Jul 2026 08:42:58 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2efcb4esm20749871cf.26.2026.07.29.08.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:42:57 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
Subject: [PATCH 0/4] hwmon: (ina2xx) Decouple in0 and curr1 alarms
Date: Wed, 29 Jul 2026 08:42:34 -0700
Message-Id: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQqDQAwAvyI5G1hDq61fkR6Cm20DdZWklgXx7
 116GuYyc4CLqTiMzQEmX3Vdc5WubWB+cX4KaqwOFKgPA11w3/xjwgtqZiqlIuC8m3XIb7bFMd2
 uMsT+TikmqJnNJGn5L6bHef4AEfea+XIAAAA=
X-Change-ID: 20260724-upstream-ina2xx-in0-curr1-alarms-f85e7d692fdf
To: Guenter Roeck <linux@roeck-us.net>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jared Kangas <jkangas@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785339776; l=1530;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=w9mDpTYu4ssoJnJ+HkcMVBmgvJ1qdCqNaAaVaYH1h7I=;
 b=+suQkW2QuF11tg680dJ6Aq1dbuQUfWiawaFdTsdI2/DSoVjhD0zdtNfjwnpJXT3QzexfhxyiJ
 UfW/cQE+OtODGYZ4yM7mJSKY6AZMdpFh+QCqNJeRNP3Yl//yYHx/wVk
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=

The in0 and curr1 alarms in the ina2xx driver are both based on shunt
voltage in the hardware, which causes unexpected behavior when reading
the two inputs' alarms:

1. Both alarms may read back 1, even though only one is set.

2. The "active" alarm may read back 0 even if the limit was reached due
   to the use of alert latching. If the inactive alarm is read, it
   clears the active alarm, and the alarm may not be set before the next
   read:

        # echo 1800 >curr1_lcrit
        # head {in0,curr1}_lcrit_alarm
        ==> in0_lcrit_alarm <==
        1

        ==> curr1_lcrit_alarm <==
        0

To address this, track the active alarm's type in the driver, and when
reading alarms, return early without polling the hardware if the alarm
being read is inactive.

Some prep work is done in patches 1-3 to simplify the fix in patch 4.

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
Jared Kangas (4):
      hwmon: (ina2xx) Replace regmap in ina226_alert_read() with ina2xx_data
      hwmon: (ina2xx) Replace masks with enum in alert functions
      hwmon: (ina2xx) Track active alarm in ina2xx_data
      hwmon: (ina2xx) Return 0 on inactive alarm/limit reads

 drivers/hwmon/ina2xx.c | 148 ++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 122 insertions(+), 26 deletions(-)
---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260724-upstream-ina2xx-in0-curr1-alarms-f85e7d692fdf

Best regards,
-- 
Jared Kangas <jkangas@redhat.com>

