Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530025;
	b=u2BIGT3FP/BeVWaT3i7+/d7AgCTP8e+nIOE2evJNSSxmxlLy+DSBsIJS4eZc8ahk4KrM
	 KP4hZMCXoYzLVTWGzZpLkAF07Iva7wiiG5TtejronenzS/BGVT/IyhAA7t2mmGHwaas5P
	 3TQzCgRTdCbdTSgytFE0KOVQuhY30RxTwugMZrcvAM1fTs14dSKvTqAlZk40zQNXp5qPm
	 Hba78DM9fsFj4QTsjmUD2sQvxCgV8uWl/pR4JbBIUaKbomxWkZiK7Yc+eMNkZBff0AAl0
	 1IPjrZTWi0i8TSnC+OLS1An9BEN/af+0FJqNSkWoYJca0ydJJ5Bx+uxXHvtXxHt105A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zun4IPymVDL2q+RaGkZ5Ofu94Q9+xrFA9vW8dw/AJJA=;
	b=zU8p+gHn3mhaPp+/c80wmjmAw5zYu1qF6pGdYPaFC8WO118UF8P4UcBBfNLgx+Oo15In
	 pTgC9fDSUPp5U48X8izZrWSGOjyTxf7dFeA1Dv+LP+zPmj9RTit78hRGFCVAWJp6Yhg4/
	 TB8Zx2amX4CQSXploAPWKGAxalu78H9zv+s3EKlAjL6Zb1Hjx8UWudd52TSwmvI66emVI
	 xjhnxo+1rkU8hvAqR2jPNbNfqScVwfOd9fvST8jNwJjiJ6LKAx7E3vbHnSL1Mjq8m4UVt
	 5jir2ChuepV2TSiKNe9sxXPptP0uKuzzZXJzHstKeC47lcGS2ek1VEqi7vKb5VFgAPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3LRXwiP;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89559606A32D
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 10:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89559606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3LRXwiP
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so21313185e9.2
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Nov 2026 02:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530024; x=1794134824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zun4IPymVDL2q+RaGkZ5Ofu94Q9+xrFA9vW8dw/AJJA=;
        b=M3LRXwiPKbhRI7NfWThStz7qRQ/Q2Ot3G7Ckyrd07GYSGdOwzz5SawmvUxdoRb0/Vb
         TdewXzl1VPTSIz24ImXOJvjnDl8EyPSvY2r1Uz/Ne2f4aTf1dbs7zJ0s2I389z6DK2wg
         KwQJExxbCjWtrBMW9Ih8oNmFkPMq9mxv4vsTCxPlr4EVaqz0XDGgS0C1XCK4iU25lWLc
         vnsMRIJd9393z/ze9oL70LhbK7h4edt0hIwsXCrwZUI55DztUh0ofO9WtHpIeHLezn2C
         ittmTLRIFSqjS/odqePkaX3NPLVlmBw0AUoRdSWmkLf9gldE/n8kTmMUEEvJgq+KcckN
         nyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530024; x=1794134824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zun4IPymVDL2q+RaGkZ5Ofu94Q9+xrFA9vW8dw/AJJA=;
        b=KWS9U1PcLOZyy6H4CF/pth2+kFL0akIxOeXouzg1lDnHKqjEmYLxlcFV3S5IOpkwcb
         bFNuB6QH/P1e8vB89D6KZsJEaj7u0Y5ktV1B/+Wrnwk5M5aMdqQWutyAlNnVgZeH1ATk
         4VPVn3kJKwe6Wcm/NT0LWZY1+oq6u94qsaeBFDySCGpf8UTSlPgjSeKvW4PahdIRDlbQ
         DFdUmGEIufc/wFbJYVeIgi5cP31SGkEWp0l0xY6Px/ZDgIvdSG8HPzaozGvAOXq81th4
         yNlGFZ9qNqPlhk2G9u9SWQlDNELs9DeiwPyMYnriHqR2am4wzV974DyOpExqVGjD3864
         pjbg==
X-Forwarded-Encrypted: i=1; AKwUvBzuDKMjd3PM67YWqNAP1tORvS6ukDeHYu4aABbV+bX9kVVCXJ2b1/DwV7enxqlHnn1n8FjEmNLqVQL5gA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJXBRvW6WgHTUCHwqcrkFeotfP/hJPNP5NU4HJqYh707WgJgykZ
	Af6Oft0m+UzOznx/rET/2Rbw/1weaQ+t7Af7Sd7sdi/RqnjDb0p3ppcc
X-Gm-Gg: AYBFou2qzzq4jO8cfA9muZ2wCH4PhOGBqTQQUNFRtxQ9FzOMYUmcEqGrVsMURjAcBzb
	d3jv5/LJjrEVGvcYvX/S+G2MMWB0O7qN1JhLUHcBwWsISmceUl/cm3eQ0L4zY24pI2lkHe9BgW3
	yZZQGNXe3Rwz8KIPxmjkcbIKmt/ZHeWjeJZet62uAqmH+ia/RZpmnhLc15+jYxsxfDYljMV++6y
	Eq08wwfCJH+AwGJfVXv3JmoEuKiIaaqfS/HYvvxRtD9isgfoVMCQEcx3sGqLWIunsnoit1dBpYL
	XG4rKAVAYpf+Gox/6k72ncev2b6/2EGOHGNB8ElLM1+w4N9qBVsgG4SmwQ8eFBppN9GUBKMs3F6
	SR/9SsBo6jtqIie5TcGR+Gic5x41jjlIekcPe+22FU8S7+EO6e+4gPjfO7RmJdoJo6NXZWYuXy7
	2ogJIbcEBsFJM+hB83Zw/oxsM3iJDzZqxfHlMb+F6CBXYqvZ4sPS1KyrDNbSLSyYsifPtyUkysw
	NNdnfwVz0m1pMRwGrn7Jmrty+hFl9AnqsXdRJiyy8mJlbI025FD962u/B5S34fBpMyMcGuYjxxM
	TP/04W226nzATGTZBIrFJrcvYEM=
X-Received: by 2002:a05:600c:34cf:b0:4a2:fe3:121b with SMTP id 5b1f17b1804b1-4ac18d68ba0mr149859905e9.28.1793530024067;
        Sun, 01 Nov 2026 02:47:04 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm255602715e9.2.2026.11.01.02.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:47:03 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Date: Sun, 01 Nov 2026 13:46:43 +0300
Subject: [PATCH 3/7] platform/x86: asus-wmi: define the fan floor table
 DEVIDs
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
Message-Id: <20261101-asus-fan-floors-v4-v1-3-b8d1c31a99a9@gmail.com>
References: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
In-Reply-To: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 linux-api@vger.kernel.org, Bartu Alev <bartualev@gmail.com>
X-Mailer: b4 0.15.2

On some ASUS laptops, the embedded controller enforces minimum fan
duties on top of custom fan curves and reports them through three
read-only DSTS methods:

  0x00110026  CPU fan floor table
  0x00110027  GPU fan floor table
  0x00110033  mid fan floor table

The mid fan floor uses 0x00110033 rather than the adjacent 0x00110028.
On examined firmware (FA507, G614PR), 0x00110028 and 0x00110029 are
stubs; while GV601 exposes a GFLB(0x28) AML selector, it is unrelated
to the DSTS devid.

Define these DEVIDs so a follow-up commit can read the tables.

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 include/linux/platform_data/x86/asus-wmi.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 66c7ab35d6c81..44189c5e6f2cb 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -102,7 +102,10 @@
 #define ASUS_WMI_DEVID_MID_FAN_CTRL 0x00110031
 #define ASUS_WMI_DEVID_CPU_FAN_CURVE	0x00110024
 #define ASUS_WMI_DEVID_GPU_FAN_CURVE	0x00110025
+#define ASUS_WMI_DEVID_CPU_FAN_FLOOR	0x00110026
+#define ASUS_WMI_DEVID_GPU_FAN_FLOOR	0x00110027
 #define ASUS_WMI_DEVID_MID_FAN_CURVE	0x00110032
+#define ASUS_WMI_DEVID_MID_FAN_FLOOR	0x00110033
 
 /* Tunables for AUS ROG laptops */
 #define ASUS_WMI_DEVID_PPT_PL2_SPPT		0x001200A0

-- 
2.56.0

