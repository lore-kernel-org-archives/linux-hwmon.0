Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948716;
	b=29i427DJoLNaupTxrb/J/dShu+SI3mY9OTO3qnxWygXlfsheB3kCA3FYALLQhEiLRikq
	 kTvD2HgRvN0WXniTpOTsPV2lTyNCK7JB4lxqLaWUyWl7MJezLWSeIy2reWUTLxyoie6O5
	 4O4lUaGa4YadfF7xmVpo0PDsD1fT1y4grri3XCndpQibT7ZwXj4/97KEiCW/7I0O1ZJXV
	 4xbo1RmIgE2efWptFVOo+bHJgBO2GxZywHo1Auplwg6hkfxO/gEDKlATgmXkFoNo9SJ9N
	 V77oPb3Yt1PdLuLu4hO1oO/jFhIFcoE/lCnjYGaHHVSliwzm0U588y2QsUntfqcA+rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SjrwptKFm3Vihql0/6aiH7GcwGBfiFtHJrgvKlaPWhM=;
	b=E2ZV1qBrw/38M3kDZjDBhniNc3j75YQ6KTMBQ393o1FBgzif0Iqw0UqRlhdAMXp87LbX
	 /8Co/mu9z2QY2/U0Onh/wCngMDWQlrW8/KrI0/TsyKlsZNq7ZAMl7K0wwAqTFc3NJacUB
	 +jZVfC6q6XKqWZq9awbynY5vry0vQpPn/EsdwH9v3ACUh65aT7DMVQOMWOd2cFf06ijiD
	 ZZzvvPw02pSpyreiJfTc/c9rc1T8n8HwX5VnfMVSZMhEt2NESyxdQEwXo3d/MlBIPDLgi
	 Bg7Q7Fb8aeB3a5cDIHjvwEtQ5I80mIRxhuVuyHv7IXn8LmT96cVqF6MXOTu8WeaOi/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WTh6SgE8;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A58606A331
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 20:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9A58606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WTh6SgE8
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so2837505e9.2
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 12:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794948714; x=1795553514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SjrwptKFm3Vihql0/6aiH7GcwGBfiFtHJrgvKlaPWhM=;
        b=WTh6SgE8INjNLhZxD72Ir2ZQrCbWJrl2Ud+7gBHxAmFggvs8xzdlqYqoYbPTSGS8EP
         dv8vMZnA5j6njvlJGmKphAOGoBnwGYar6Gbghy/Mzg8XismGaqzHOmeYSuDkGFaKf9c6
         aaX+i22+YGPDLUwvC+58241Kl5QqxMDQ7BfERNYhNwFc0imXO/SaoN3iknkuGo44KmZh
         rT/kUINplpgVVt+jQzBTpAw+ZaTEKzOT8fAFbLWcyoTUddqUHgSyAXtVJf3Ulu4LZDh2
         WWmfzpbsRzdJiJS0CuYp+E4V5C5kq5mtfXp4/eoYGo2DIWC7agOuAG2KfRN7dURkSLlJ
         tvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948714; x=1795553514;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SjrwptKFm3Vihql0/6aiH7GcwGBfiFtHJrgvKlaPWhM=;
        b=AMAk/PwF0JGQRAmwos4eOInTFHQkxDMqnmhTxdCLLgMRFTyIRxKu50t7NchP/X83oR
         1xwntou3lLfe6iclBCKq7TmmZYP8ohoBvOT3jnVhNTGdb5in3rf5WNxRczAV859X1mVU
         I/S4SfR5S1dCEIqW3Jd4IQ5Iocgd+r4Bn/ECWGHm8k9if7FHp5/5KX6GwD2+2wcTnNWf
         q0aIAG/fdpoxdxJM/WrWj8V6I0gGa99/G9w69+zfyZ3fx/goPFbgnJelfBmNe0DOv43R
         64jsUj4JH314o0tq1lndQ6zqr/GWhrV4QXItZW572eLKu2szE99NmWOStt9hHxFTLnXq
         f56A==
X-Gm-Message-State: APuU4Z881oS+CMQsNZm3PGeUgk/qIBTKPMbxl7D5GJwoMDcuSNUPvKYV
	tJrMY7sHW5yW0COXHqmR04WPSXuBa3dT5Vu18yJ4v9yJUbuScyJXY5sJ
X-Gm-Gg: AYBFou2ySuLSTgoGb0cWYepdXQsiuShIFj3lGvObzjBEad31x4c5uLRXYVls8WSYyH/
	2+MX0vUyKgZfY24jvgrC1msuIzop35uQER2PNF84EGLeDkgtHGMbBfpVKo69Cpd710pYh7dOkI0
	r1CLtfvp8X0uk/XOrbwEImvraimtIGJ4P/JXnv1pbNTo2VoB2J6yAorTA9t2kIzYR7xMe5xEX01
	qKCuQyC1vKd6fdANiRTLve7eeolDGOWJybJ5/veat3qrYl2nixNCBsjxtgQNoPxp9kSPCTDZw5K
	Nlw2vxEh1LQ75X7FCehiKcVNdprTrP21FsHs5WDFRAFQ7G9EiUC0R7PypS7/N3CI2Q73KtFMe1R
	mxSm+LaqRj3t4lUR4Zg9QlwBhmDwY+RKtIzAkX2k+I3mQWX6HytAkSe0qxzvqLPmUcCo0tXJLcm
	ve+u8OFVPthFAZk3TNDFdsgTGC6jz5J6yp+/piBM/eGok+MltSPAZTVh4gWY8D3/lAefCCRW2gU
	E2cOyqxZ6kjgvYSj1aZJkEm3ppr7yd/JDrNay8OWlpjRJfu8W1r7wyOreaXmDrsabsFIWiWuZuq
	FiRdb2lmQ6xONubnhehmQloGcLHApLa+mv5c+goStQ9YXRtDlmDFA66DViQJ0jXUQaodF3Ib5MM
	AZmYEWWy7iw==
X-Received: by 2002:a05:600c:3485:b0:4bb:741d:eba with SMTP id 5b1f17b1804b1-4bb7da1b79fmr7626115e9.13.1794948713842;
        Tue, 17 Nov 2026 12:51:53 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7840b05bsm136893465e9.7.2026.11.17.12.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:51:53 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
Subject: [PATCH] hwmon: (ads7871) Add error handle from spi_setup()
Date: Tue, 17 Nov 2026 20:51:32 +0000
Message-ID: <20261117205132.141964-1-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ads7871 probe() ignores the spi_setup() error return value
and it attempts to write on registers even if spi_setup() fails or not

This patch returns the setup error before accessing any registers.

AI was used for peer-review the patch.

Fixes: e0c70b8078629 ("hwmon: add TI ads7871 a/d converter driver")

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 drivers/hwmon/ads7871.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
index 36297bc6d047..a1ffc35d9272 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -187,7 +187,9 @@ static int ads7871_probe(struct spi_device *spi)
 	/* Configure the SPI bus */
 	spi->mode = (SPI_MODE_0);
 	spi->bits_per_word = 8;
-	spi_setup(spi);
+	ret = spi_setup(spi);
+	if (ret)
+		return ret;
 
 	pdata = devm_kzalloc_obj(dev, *pdata);
 	if (!pdata)
-- 
2.56.1

