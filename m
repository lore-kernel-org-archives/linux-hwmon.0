Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334403;
	b=NwEjLxn62vO78eXspw6lcnZOwXZG223AFKcrXB1QIA52BcKONs5+c4VLsIXTxt2DCD8H
	 +QSIeO3B9j3otZcOJrrn7anl3yd7aocRMRNocJjFmfWEFJ3HwAkigZYxi4Re2FOZbE4IO
	 EE8hPRvLvNAMcq1F/IZhkY+473p0JnkwIwFyke0ayqPbSW/IS7yhKbNbuzPbsqYK1earU
	 S+LER1WdLnyADWY/4Fatv68qCGhUgTMYNcxXoQcBDMtJhhRhU6vo37jSJeDcXTxsZqwZO
	 2SAKSm9mhoDEB6vt+vqiDY2UQaefTrLvcY3Q1Pel9Y2s9CQzYtuVApgf/sN4Yk+O21A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vjV3ThcETJTQohEswOVEipA/50M6i7Rw1D6pUxeaH6o=;
	b=hoMYFMMUhoIJQDFkz4AmWhGlkCBmISQSrEJr3TBO77LIw3Ch3WNMONVlBMnBqt+ttS77
	 c6ygDxE7+8uUL3XGacMy7biwhs3vSllDZvgkrd0t0TCuzak9jJfRo8JOzsxqyTYcGF6t7
	 HQPlEiZGI3b29P29UnDx7lJrQwYEPuTnEP3qouv8a9RH2XaRVh+5cMYU5e6Hh6Kx0Shl5
	 FqV6Q4wbYPeJnHZ9KxPPgviQR8SCfZrJC8xmVlFfkxAyQpB+kWlvVevPBX9KcaaHPOjR8
	 4m8CFqHK5xc202HfrGF+d7jpeWnHT83RzmTZp9VT/zpGyBhfPN86fXb6tpqv6jqROCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OOGfl08i;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A62606A31F
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 04:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A62606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OOGfl08i
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8246b13cbso2756775ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 21:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793334402; x=1793939202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjV3ThcETJTQohEswOVEipA/50M6i7Rw1D6pUxeaH6o=;
        b=OOGfl08iTrDcSP5CRoXDmSVya4AolyQdAG5OWHgE9ofXhHL55pCqAnLRy3QOWArl7Q
         waeVAr4qZkWUShO1RmfxQqhrxoPq/ZSnc5SpnwuVgdXh4uUo3uTMWH2m3jGzBhUOoKFx
         piwI3wn6MAqmd1Jhykxn1EE4vgfRhKxFaW6GtH8BDqaTg6lhfH+PQ4OKYqKo0UaA/SHn
         G+h4ly81vQPBO+1raeS2XxMsGTShwbFSSrem/WohBifnUltiwlf2RuGeIQYnhL9m3Aq7
         m0V3jj7XEILRpMI0/2a20+1yKez2+/pkZAsbweZ62X9Oq2XkzL9wOS2u7ALkWWYDls5i
         Qy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334402; x=1793939202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjV3ThcETJTQohEswOVEipA/50M6i7Rw1D6pUxeaH6o=;
        b=g7bQ8fsf1nihNp7agr/npHWRzXoraZv55hDhsnEZs9pxdLzKIwhYZz59LfCjqwMblr
         QbDUhe8yMT/ujn9GXdtNYj9T2cLKCzbmsh4x9rqgyT3G1FkWBKbeDo4T+IeO5DIQMuIL
         zu9B6V0S1stl9wflc69UfMk7tkHGY8HAmON4I+eI9/qD99mR/3M9lCoPXW7uUPCoYVx5
         SJFxhJ9epMPX1QLWW2PkNRtXxe0ss9i5DjHCcIRxZrjCBXB9JSn5PvwU3opAv3e/Gy9e
         mJAaVOSt+mJCk7ajeHDf8LaC2ieEL0qgN0dP5jibRVafYP1J6LXq8XkQxcsN9Sl32mrs
         2+fQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHC6Ihp0gFkzAKL9gNTFKDlkvZFVX+CKcaUijVHUN5T7Wep35IGJsNdI2gnzk0EmwMThqTecS1eqWhhQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKBJEwEQCG7kSyJMkfqFeaytV2GZVMto9PjuKFYyttR+ca7K72M
	SD/m4sYEtpDA/SbioM+w50EcHwhLb26VK1PFN3AYHSL2fHWvduu1DMs=
X-Gm-Gg: AYBFou1d2cYwDCPRsGjmnptJhqWNG42kSYFxxHl1Gj7scQc/q4wse2oZjqV7PPAzJo7
	BJBQEoS6oAF7DPNg1xSH8leQTGRWpL4l25Rlvlk1jpUE/zlMbpWXfMLjPPhBlKMFkSqUWA92r9K
	QWOSeF8kz3EWb2NVSrSM6oq9RkTZ1PxmIc99Ezx7C3K6kFMqvHmtGKDPuPrPM/lk2iXxYYyYtnd
	vZ2aOqe1HDsZCrPY53wlgQGbJkuSWV2VumwEDBGwKp+q2VM7fmIS3F05wnmZBpC6SJh8NGnjNuC
	dg5CsJDjyqV1Q0PT0bks61zexv3xdxO0tyzIrsmgi/B7AJA7IBzsGvI7J6LwIvgCY2jp4Wulsro
	Aaq4iFXnu3yOf9AZf5KYZ18rNZrXmby5j69OA6TK712ORbI4Zxx2j/pKDFhkasndINEFnQFOubU
	594Memsl83xJwKcRj/L8bWiDlCUqwvJXEFhFLkh9drW39jxSGHd/j0g+/iJjmFiqSrY39KvX+FB
	w4a/XNEJr9eDJ5s9kR87eL6F8qrOSDlc0BQNO3tR7d1geK8k0K9QUdcjsI2sqQ7n8ytlGbI4u5K
	/Yv+dnpQbBVLreFaAQWU4/3PMMIQRE+33dCVez2fA3HLc09xym96ahFkdo5y6aGnsqjZ
X-Received: by 2002:a17:903:faf:b0:2e9:5eee:e087 with SMTP id d9443c01a7336-2eb364e553fmr13990205ad.43.1793334401915;
        Thu, 29 Oct 2026 21:26:41 -0700 (PDT)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922fbc4sm1965845ad.24.2026.10.29.21.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:26:41 -0700 (PDT)
From: Burke Cates <burke.cates@gmail.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: glymur-zenbook-a16: Add Embedded Controller
Date: Thu, 29 Oct 2026 21:26:27 -0700
Message-ID: <20261030042630.2744339-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261015-topic-asus_ec-v4-3-af6305ffcb10@oss.qualcomm.com>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com> <20261015-topic-asus_ec-v4-3-af6305ffcb10@oss.qualcomm.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 15-Oct-26 10:55, Konrad Dybcio wrote:
> The Glymur-based Zenbook A16 features an Embedded Controller running
> custom ASUS firmware [...] It provides keyboard backlight control,
> additional temperature sensor readouts, fan speed monitoring and a
> number of miscellaneous functions.

Tested on an ASUS Zenbook A16 (UX3607OA, BIOS UX3607OA.312), on v7.3
plus out-of-tree Glymur platform/board patches, with the v4 driver
(2/4, now db3a9dddab5f in mainline) and a local change that leaves
the keyboard backlight to the HID driver:

  - The EC driver binds from this node at boot.
  - Both fan speeds and the EC temperatures are readable via hwmon
    and follow load: under an all-core stress-ng run the fans went to
    about 5900 and 5100 rpm, and both fans and temperatures came back
    down within a few minutes after.
  - 115 s2idle suspend/resume cycles in one boot with the EC bound;
    its fan and temperature readings kept updating across them.

I didn't test the EC's keyboard backlight control, because of that
local change.

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke
