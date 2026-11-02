Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630957;
	b=C+0GZDvFSHWCmLhTPQB/RMhfA62OUBXxwSKv8Fr+JSW99GJ+yUudn7SGwWQ8T2VE5MZe
	 V5wVdm6Y2kokRg+6RiKBOEO+rpurlnTFUWuu21K1xx+y1ZY7zxC+2CsFdlbecHxr5q6ab
	 m84W+taVw5Qx//Or7PjGif+oEu4OCdu4XauGtTImv9en21HMZD7/Xo1qdLNmbx+K2bJJn
	 jF/NbEkrsqx8ZYjvXWzRyz2gFoyi2DsQxD+Bmn9N2Zd2ZBcbZ4vIWod/4GpUzUpUzm+8D
	 hg6IwMGPLlreKe9KNpcwYnGZ0G1N5w2F17HnaBP80zgR73UE7G513/5oRU7bweUy93g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=K/V5t+jqFiHhP0+zyx64+sk+HwdaCdpfP+GPzqrY/v0=;
	b=oRBc2nkjjTPReauCeUHxZVRhBqF4PI+//6csubwaHOMN+UF7xuygThH1n+IjW/g813TU
	 m7r0k6Tg7thPMf+DRGliC3s5Qn1wCHFXQxifNiXpTdQ1bDXN3I3v5KqHy0PfTahgA6kgJ
	 bZtcJ9zCqgcJG+i/ofHO+LpVxqicfMN3FpaWTTyfKFbsjvK87c7TP3XlbkS/vqr8hnp0i
	 U5MDDhLFF+jiJB+mFFNMD+7nzrkKfA91MRw3opAknaruz+B7t3/ZzZ+gkh45M96f9Qof1
	 jrybUVWPzunk/bmOPD/HzFx5oBp0N2oGiee20HUsGb05Yezt24FClXToR7wHF+fPuGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rWNWv6uH;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEAC6087A24
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 14:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CEAC6087A24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rWNWv6uH
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so25151185e9.0
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Nov 2026 06:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793630956; x=1794235756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/V5t+jqFiHhP0+zyx64+sk+HwdaCdpfP+GPzqrY/v0=;
        b=rWNWv6uHyaGaK6LrFg8qFru6mVZ4exHOSisVkTk6L20iqAGNIWFp/9ob8AR+oKdbj2
         DdnHefWTPExVwIIb1bI25AgVV80vzO05vepSyXroaQIBDxLpRi0AmQV5fQLV9Kn13lID
         F8iJ7Q3Bsq91cqz/wklKz0yhyddwGLJjNC5q2A0wxE/P+wKC6/ZFIjqXL2gujeKBQUJr
         PESZ6LeheiBy6/CQcm6tBoRVl0ydPrxi0k0eOZeLAThX1esvXm0Ue48Tcs87q6gd0epI
         EBGRIY/whhJvOxKBKTRcJh28zmqlkGnejYhqtD2sYz60Q0ZlyoDnteHYqJIQKvAKVzYa
         OCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630956; x=1794235756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/V5t+jqFiHhP0+zyx64+sk+HwdaCdpfP+GPzqrY/v0=;
        b=JOLZBDKh1N3n57ZCwUbN7qj/nklmMpJ89yTfhH1qhdYrK2nsNI9fbYBClsMT4g/X00
         tZxLhbGHnDYlJ1GkRPykP5G0efChC4o2qaCuTJJra6C0fr3QWhAuQeU24/+fjqmMu1yg
         tQTGMpSxhKcryhPfaX9ZJkXKg52mIUHF8Jevsw20Wu8V3Y5F3eUXzkLDmmOv1OlxbMG4
         CePgcvOhJeIBtWN9eawY3eiZqdkaFM5/FpVDz34i3Y+/7ZGS57XaH8OC45Zmq9wgW35B
         tUwplc3m96KpizlxnOl06aaUTuyBH1TGhOzOiWJvctMLp66nNchEZpyn19rhl0hGnugW
         ueRg==
X-Forwarded-Encrypted: i=1; AKwUvBz0tADYBAjmCL0iSsVd6CYSyqhNfGR2iI3chWaCOYcckrZB4TdLt/S/I5PnIByF1Y2XrsWrjgIjDsXDDQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIoc9NqJw+GP1wrKIzvcC3/7YTZHQpEMnQDitql6F+n8nmyJDqz
	w6Iea+aFIx9v8LjHFABrW5gEBR4nfQ1bifqQdm7IdZP5QfR+SU/1X2NFRtZBpBpb70U=
X-Gm-Gg: AYBFou38WC1aNNAYjSKm7DMoQsQPAC9SYcG1n0Zj3TpRLyqmvF6luwAJJl7Zdmi1NH5
	4/IsHYGtUEj5uHoFGIizrHc1a1G6LAw8PeSk5z5+5jv8Qr4tb46jnXGjSH4OE2CdX98eDgkbr1S
	WgaYuV2vHqOwqLzZmGBJ0pxu/+PgcJbsEHKNGLuc7jVG+1Q8YPvH0K1WmGLinYcq9/TOd4+eTXf
	TNZcUaYrBwUDF5oDkkMz+/06oV1pa0ynA79jYv7IeC9W24v80CcpFIUYfckTRp8cUoNO5/jcfie
	guzQnruxvRqJGdfbwE3CQ2kjHMsEZaNxo8kBi+C6M6e1RTdvFoQndAcTVJMpFRGpFu9yjyA0DZo
	iHv7OiT5BGCZVooSGrc2FQaScxLQfOMy8UvkbvvuLYjVTXJAZ/iTL1SUh5LuUKxfsusaCqRYPal
	t8cD8ipkQEU2Yf2I8cphuBeZH5KvGkuq66NYI7sgAxyQWYvhRjfn3iJ6IbHbwUOARuXfaYoTBtw
	Q6LkoB7OjR/ParasrXEGxlufoeW4AEAaJ9Zbu1F6ZATz0FaNv4BLBj9cUtt8bnB0+ubpEZ0dXXC
	zPfer+SuKwpj4CkCQ0ih2lznm9f8guhybLc4hixxyiZT759O4qIqA+aMJjtIJEAAB7fjUogF
X-Received: by 2002:a05:600c:34cf:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4ac150b3d01mr246636885e9.2.1793630955558;
        Mon, 02 Nov 2026 06:49:15 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm447287005e9.3.2026.11.02.06.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:49:15 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 02 Nov 2026 15:49:05 +0100
Subject: [PATCH v5 2/3] unaligned: introduce be56 unaligned accessors
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
Message-Id: <20261102-topic-sm8x50-iio-max34417-adc-v5-2-0ffa5e5f2d5c@linaro.org>
References: <20261102-topic-sm8x50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org>
In-Reply-To: <20261102-topic-sm8x50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux@analog.com, 
 Marius Cristea <marius.cristea@microchip.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1503;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=q+s9IUw++9sNzM9FIO/G1OqBY3KuaSP0G+EMey77yQE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq6KLn7W/XNqDRG6ymWAJYw2576T5UyM8w2QGAAVwF
 uECyAhiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCauii5wAKCRB33NvayMhJ0a4YEA
 CW/ceDj2KIYJjKXvikOgSgTOTmfGfSTkfJWIgrntcIlNUe/NS2RvGYiUQWi8X/iNCYMkXiUoN9rj6Q
 r/XJmqJROqvBB9iVvUkdZUcKQTddRZSYB2a/jFkZ9GHSHfagzxGtnupo7hJvxlhYUR6I/t9QYpOyb2
 BWUf4gZ/rfgt5Soj+QASIoUUrNgoJyVHp33lCak6B8qP/jnb9/CHkKSmxEirZqtL9E13Pp+sZvJcZJ
 NpJmEmVzD65Nwf2PPg9IFCDa1rteLed7G/fdckHA2JXvPf2sW3i6HhecjPAp/CdVrq3wvVhSjegmkK
 R9JGwveX5T7kcsh+fLvMwExC72fVopUYZmQnaCowmm/AjtKtc5oBOYSerxl1iA8YIGj+HVCOLP0gXv
 GeJjeJxjF6hlv3BPl64veIX+5f7iWQNhqKBs1v1HX/ypDyRD2NkS3jj6JsQt1/J+r7Vem3IaV4d96K
 KLnraLKIXuzdrnONZhCu9G3/zeHetSQO8C5sOKUHJJkPfjOgwuk2jPbEFsOllQzoiS2mZuC7rePur5
 /r/BGixeyjyqtafe2NeM4/PsvnzqZCBD6BdQ2C4ui6r+N1bsaljLxoCfyag65oeKJAisZPtMflyTM5
 2l+iBqJd43j6QC5BUvpqBNR7GHz5Vapmf2LC26tCDmAMZxVsYaZoP67e3csw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: Marius Cristea <marius.cristea@microchip.com>

The MAX34417, IIO driver, is using some unaligned 56-bit registers.
Provide some helper accessors in preparation for the new driver.

Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
[narmstrong: update commit message and move to include/linux/unaligned.h]
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/linux/unaligned.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/linux/unaligned.h b/include/linux/unaligned.h
index 4a9651017e3c..2105743b1800 100644
--- a/include/linux/unaligned.h
+++ b/include/linux/unaligned.h
@@ -143,4 +143,31 @@ static inline u64 get_unaligned_be48(const void *p)
 	return __get_unaligned_be48(p);
 }
 
+static inline void __put_unaligned_be56(const u64 val, u8 *p)
+{
+	*p++ = (val >> 48) & 0xff;
+	*p++ = (val >> 40) & 0xff;
+	*p++ = (val >> 32) & 0xff;
+	*p++ = (val >> 24) & 0xff;
+	*p++ = (val >> 16) & 0xff;
+	*p++ = (val >> 8) & 0xff;
+	*p++ = val & 0xff;
+}
+
+static inline void put_unaligned_be56(const u64 val, void *p)
+{
+	__put_unaligned_be56(val, p);
+}
+
+static inline u64 __get_unaligned_be56(const u8 *p)
+{
+	return (u64)p[0] << 48 | (u64)p[1] << 40 | (u64)p[2] << 32 |
+		(u64)p[3] << 24 | p[4] << 16 | p[5] << 8 | p[6];
+}
+
+static inline u64 get_unaligned_be56(const void *p)
+{
+	return __get_unaligned_be56(p);
+}
+
 #endif /* __LINUX_UNALIGNED_H */

-- 
2.34.1

