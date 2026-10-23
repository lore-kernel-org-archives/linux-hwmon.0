Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750350;
	b=pUxt2Bg3emjTFiPSXcnvdSbzJxom9XeG2CLlaQhGg74zOXNss73C6DiCdzWnShGJ6EuN
	 yRd9n8ssb7nbH8Sq8tyDqbs1B3yl7jY8vnL8fJ6ECGa6If0ZdP0ASIlEyv978PbnY2evJ
	 m6Du8VXw6Tf1TLR+WD1ZJLQuNcQVyTitrXaXNDuMIsEj/JJYN2K8HSz2WFnoYpvp/FlyW
	 wcqlfhXa9mPzWGnfepxjmJ/UzuhjyFf9xFHryaKt+YckVwTxHjzV3QPCFBiH1IRQfpVFK
	 4u17wViggAGq+QDRjfxsR7VWw12Jcp6dt5luSCzFSRRnPxqw6Aszg1KqISlxN8dy6VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=is7L+B2RN443PYwwoWeq+UVhGmTjVPpzuTGcDZVXmgU=;
	b=KHAQksG+WQNiJty/poisUZQZpmaraBKt/kefM5ITQjyKkXtDeW5R/uNIh1hRPAedvNFx
	 IlPZP2Fk9eK/38AjfEor/Qr8BxEpJHlfYRBgjIW12JmMLp5mfcFqXNUE+QuqJySnEK5G6
	 HJwYmfYkCPQqF7ZjaItkXQF+RQh4PHtCss77FQG8VJIrgDgz6d+53vC/u9ihXDLWRMoPh
	 XaarxgyvhpwBRr6Td0caN3kORDkvHfZEWMmIz+caJc2RPLt0lTCg2VtWZcldNTR4YRj/w
	 v7mFy6zTcxrN6cVSGASUupIdMaD+Yafw9okVLG37nhgRCttQqFHkjFTGf1JvEYsARkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TXZQvtD7;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E36E606A334
	for <linux-hwmon@vger.kernel.org>; Fri, 23 Oct 2026 10:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E36E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TXZQvtD7
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso7721675e9.1
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Oct 2026 03:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792750336; x=1793355136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=is7L+B2RN443PYwwoWeq+UVhGmTjVPpzuTGcDZVXmgU=;
        b=TXZQvtD7jcqOHabVOR/WQ+U/XG+v8vjWM/Qmsl/q6MzNZD7uqig8eGptjZOesICJ+P
         ScR9lJVpLDAQrN6bNGDoIzP2zfnTu0iNIW4E5ihRHRNcomwDgzhBfltCJErnLQgizFnP
         S00llh1bjJPqLGcEzS6ZFocGV5WDpL85Le2xfNFTfrCNSstwYtpe0mbeJ7qhc2DHuvOL
         Bcjx2MtcWUMSzpiVgxQRtlhn14/FrOMDJtRIiMOO9EZURIdpIZTJR+t7d2Y9KJAc7J6f
         3cj1tMnVc+viMiKK80xqhvsvmQcodKjtbWVwwE2w7iHG+6KbtBrtw84P6UpgGVAD0/Er
         MGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750336; x=1793355136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=is7L+B2RN443PYwwoWeq+UVhGmTjVPpzuTGcDZVXmgU=;
        b=GB19AhNTxEwtqo767+NSJG3w3uc6h8DAP4I1ighAbwapnph03Bm1DIrwn0uZWwzg0B
         b7jqoppIQdaCGS0zMPUtuZq0VcXNgW1F3mOWeppb+NP0X/CpkrL9YV+1JjilzlBctSz2
         GQ/SUsC5kwqmz/1qFy7nX4zYyVoHVELgfHTCbTnN67ejBvKgtTqGG5XsRIy7BJtvRIJx
         sXKJyRc7UJffUPQosQejkQ2VZZ9ddFP7OOuqfhqmMCnd1dHwFapIja2vLBUACQS67Adr
         qnUzI/XJOSfZOYSfXHrYQpe2tipTVCry0HRRVpD/pQqUGK39+orDVphKf6Wlu5JNFF7l
         9+Lg==
X-Forwarded-Encrypted: i=1; AKwUvBwpVSW4V4caI0zgg92o0ZoYSsstlo/h5Azwx1V8E0v8gc9UF/wwq3f3K/s+spyIhEA2PATW9dwF0vbYhg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLEZaC8eOqDuYlEUd4MbH/ksX7ihVAvGnvR9DycjnDSWCRdio3C
	slCIIZQ5qYhNTLr27DrEzcP5wRTDME6KJ+n+HFBxutO3JZhUEnhXJOcZNJI33mRXpf0=
X-Gm-Gg: AYBFou2HU7XCPnVX3TDWplFkqPe6oX801S4Ayqd7xShsZp9O96O4O1JhUz+pzS5ZZ4+
	oaC1zOp8T03x8XOwQknB3GsAhZiC5NCthF7dvURCNMtgJrfxnZsRp9w73xNQdpOdMW4cTU8oFiP
	xPRiygAtsCGR1B+MGMdJkjXEEpacz01f5kEO4jMOd8oNGzIrrmPM+v7cs2GlrI8jL5jHLWR+ByD
	ddQ2zdnJmjSbPuiXBJCXbkqi3fjF+YrA2VMkDORwUvPITupRSM9aQBAk4QTBK9HO8qcI27ExEWg
	J9qf3vDKujG1vjqAnJ2dNygOUItcYcgf97/xOAFkNxBIgwCE2/XB16FqdeHC3I0OpAw/tMmm1J8
	Nge4ojSqih8jT4p35rTfGGy0EhKkVDERRlD3cnUrxZg8Fn07OVmdaWSMTVIGQDATGstpwlVcMuf
	FwkUZ48qOTQtBAHGgGcIemHjL6tVt0oDnmfLGoDc+1AJygdVQDgs4+HXA53IzBYKXiv4aB603A1
	nhegg2CULGPDeM0bSwgWNLnU5kZFhyhoB1zgltS9uPnOVgRP+6OGo31+funHD3NA7ileHydfi6/
X-Received: by 2002:a05:600c:3514:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4a211ed7602mr26707515e9.26.1792750335754;
        Fri, 23 Oct 2026 03:12:15 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211b89beasm57982975e9.5.2026.10.23.03.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:12:15 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH RFC 4/4] arm64: dts: broadcom: bcm2712-rpi-5-b: Add RP1 fan tachometer node
Date: Fri, 23 Oct 2026 12:15:57 +0200
Message-ID: <f00b7ccef721c7120ac10a9507ab211773787aeb.1792748691.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1792748690.git.andrea.porta@suse.com>
References: <cover.1792748690.git.andrea.porta@suse.com>
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

Add the hwmon fan node for the Raspberry Pi 5 to expose the cooling fan
speed (RPM) to userspace.

The fan tachometer is managed internally by the RP1 PWM controller.
This node uses the 'raspberrypi,pwm-tachometer' property to link the
rp1-fan hwmon driver to the existing RP1 PWM controller, enabling
RPM reporting via sysfs.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 748be8f1ee9e2..9bc6d0e9da1b5 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -16,6 +16,11 @@ / {
 	aliases {
 		ethernet0 = &rp1_eth;
 	};
+
+	fan-tach {
+		compatible = "raspberrypi,rp1-fan";
+		raspberrypi,pwm-tachometer = <&rp1_pwm1>;
+	};
 };
 
 &pcie2 {
-- 
2.35.3

