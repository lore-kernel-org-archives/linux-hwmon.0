Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193555;
	b=aOlA8zkDd2QM++vieF/ciX5OKduHK8392Q1NTjIZbpcp9UFM8icia6vdr3jtSuPY9nJl
	 flMCf+iiwG7BaFqyzU2C14DDjAVeq2zCftaWncbBu+pVaDTOyI9rk5orf7nJmvFHL+EhF
	 e+uKPFP+9davMTKBccGCbxEPsnZgXY1zHrPUMz29P9Ehrory9UDvvRZFoOcnpi3DZDl41
	 6yw/qiDL1sAbQhwi3rb74z7vQsorg7eX8j1tG5TcTansVnMkPJH5t02JM+1/fqvwTJyI7
	 msqp5hT/k3Wu49lSUb6D432zxxl9MLe+f0fSnXHktXYGwHDxNiMlirhcogVX9VoDLUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=9uAIb9ozMRkPqsmw9yBOOJKC9hD2HvYyYUjtqyKcWIA=;
	b=sk3cFt7fsXbdHWMyWgFSJs38dNZilRkdcFWJY1MqaXGqRUb30N2YXfjLNTPoSJKA8bg7
	 qN1LsBHD508KX+IS00Km4hicD9JUB8PZ9M/9BzatFytHgIEg181TXY8/t6qsi/QVUaobI
	 fKK7nSzDIrJmmdk0cHLcW0mF8PMptDTfwjJ+OdJr0ot8CjIjD0HuTvPZSVJWS5cm4mpJA
	 Wj8icwx1gZDDOti6cFkXXXRRdRwHznb1k7XrfTLIy4hVh5FS7sNG0aq8g/ISm0h39wDT8
	 UZzyWBemPBSTuj5bquJClqlSavA69lEs0urvvoRg7R5piegVTPp51nQn/w70fs6uCDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iMXd1g2t;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095A360A260F
	for <linux-hwmon@vger.kernel.org>; Wed, 28 Oct 2026 13:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 095A360A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iMXd1g2t
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso6424035e9.0
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Oct 2026 06:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793193553; x=1793798353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9uAIb9ozMRkPqsmw9yBOOJKC9hD2HvYyYUjtqyKcWIA=;
        b=iMXd1g2tBYkihoc5u1/R6QT7SOmDZvI4CPOEn7qtT40TDcm13pH4/Pqg0nJ21lcYMN
         gHz/cTy1n+cpf6zzGsmzUoPogBB8yDicYGgqgPh7uMeWP9l8uQSDqycV5BLDnXCJLg1+
         I0d8K5BFFAgAx1QJp+E6GKeQMSCGfz8VxXILv5cYyOxpxmupe9jT1OY71A/0RQqHzG4x
         CRJr7brk0pe2OwMXd/97r675ix8hGQ8rY4mkMWKXEmnur8BiURLbsvskC5+PWfHGYXKt
         E0st/FZrILS+bsFXETdskOqMVnF/6/Dt5FYD5FcG45/PA8GV9Z0syqf8DDhZFXkMZZ1F
         r+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193553; x=1793798353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9uAIb9ozMRkPqsmw9yBOOJKC9hD2HvYyYUjtqyKcWIA=;
        b=UJFqlsK67JAu4/w7zEj7bbZ0fare3pMsLDGkqXQCKN8lGwyTByX4IBkeF5EL7Rqylx
         p0CQ+Ny79H4IsopbLVdGuk5r9SPthX7br+87I+gBrRPR6MxzABhPVUQod7aMP7qGnKwt
         RWGHsb7DJzDjoUqpfkyZnm1Hqg49uE7q0foRWJ4B51lPh2h/mw5qf4+03v1LQ8Nq9Eg0
         rnRz1aOhYGYkgABXI/cSWJ9sZVKKrsfWISxXEVAabdsH5/yMj8VDOSNDrrSuJ6WyBP7N
         xhYk/3HUhWvnasklKQvvF2EwnGwErtoVbjUxbSuE6IUWPZTqaBJWuNbMExXLOUQRhc4S
         ZpTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjgdg4RlMhKtkCIN4sx1n4mkO6/MjWdDC+sz1mlc/gXZcshCnvqGN9zYl53YdAkhAUHTvGeJamqVDtMw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLGpn1ET53LwmL4I/5+M2vNlfhDQLoLeWA1KcyJuYmNZz6lOUof
	ZKjjjqEsYrdSrmWVgMTysj35BhzG1HAaynIo+d1e14mgMTCY8rb78raaFaHzyiYF+Tc=
X-Gm-Gg: AYBFou1Cp4Rcl5a3Cmj+7jarRcuB+gVlu/GPIZFoAjmv7z+BnfB158HGgoo+M+vMHBM
	4V2agLF3XybbcBqLiyPgyH94grPzLKkEqU1SQ9JRN+5VzoNROWt6QubZBJhbWJmjlcIU/Ib5YLt
	zw7HAJkbrxXmbVOBs88Q8RPaNRn4arXHXhT0bH3MPW+yh83BCaBOUvN+CpV6IriglLgHFKkaBBt
	9V11wRkMGNoAKKH4vs3Tr9mr+aJvrzMB04D9eRvbIFGLZy5/1rACGECSSDSfLC0XrtA7vYiHlKi
	+FSlik801nX3l/UUbqJanbTYKzaJLkI/bfsHEH+AcGHl4kna/n2VzkIQKPOwg7GZzRRzG3SdKwA
	u0H9JtGZyJS3PAeaq0PA982KVQmjBQJzt4YKUYgOHnekPCgFJDEyT3XlqS9OzkJu8mQtTp0TxgQ
	mKotCR6oMGbOgv/U87RPT5n5QBRINiV4CIOM34yud0ihVERcTTGz87iyI2MT66sN3uXT9gjB2Ut
	BV2X25+9bi5rr+0HiV19xTVyVda5UYsnBkPViZPVuoX8K4FJZ2Whvak6gg03pa0QbxKPEjkRpS9
	g8GTmvIGvDgMk3YDJAcb9XkQ7v8IrJ5FBW7eQqD2OjQ=
X-Received: by 2002:a05:600c:b8a:b0:4a2:b89:b02 with SMTP id 5b1f17b1804b1-4a96667c848mr47048085e9.10.1793193552104;
        Wed, 28 Oct 2026 06:19:12 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a996aa0ff3sm19869395e9.1.2026.10.28.06.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:19:11 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 28 Oct 2026 14:19:05 +0100
Subject: [PATCH v4 2/3] unaligned: introduce be56 unaligned accessors
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
Message-Id: <20261028-topic-sm8x50-iio-max34417-adc-v4-2-d4baaf3ee903@linaro.org>
References: <20261028-topic-sm8x50-iio-max34417-adc-v4-0-d4baaf3ee903@linaro.org>
In-Reply-To: <20261028-topic-sm8x50-iio-max34417-adc-v4-0-d4baaf3ee903@linaro.org>
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
 Marius Cristea <marius.cristea@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=qfQWKiFOPYNKQaFmvtbGsS16Zvd0DPHnTyBZWWyunTE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq4fZLttrDpTiI9a7fF3u6Vq/mkfoNhMhsaRUKeks4
 cPp7zECJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCauH2SwAKCRB33NvayMhJ0Z6+EA
 CKtHVa7jGBl285caxNm9xQSN4MTl330vhBNWXGFu5yC82S4NBo/cW0AGmnjb0hfLCbcQmTv14Qop90
 Erqm6Sern9H7ljNz8gHZXmipoIlYUE3U5aAB3KSCJBau5tNqWrBrrI9FAaB6kX71wEFTiQNpubSz3A
 ioNyLm6FRaoUTIdqQhuosHkJdM+inqv0Qtw7fwVESL7VjZGTSK5rSFE3WVyHPMW7HJYAVRZPY6ys3A
 qRjQjGf8XCJxLTqAJ8vBAIkX3Ztc1m+7ry0unPW0MkPkTjY5ceJFo6XqRtufZRs+igf7B6BW7Vxfrl
 qQBdJJkcCOixBr3gJqgm2iJM9oUvx7MIX2H8otzdtuowO2soismpKaLCzOV+QEd3P0joa538sKaOWd
 QXeY1Kw/+qDruF3fCi2APWxGME/ksnylZ8+kwN05i5bPn1L831P6rx4GLDcdp+qHSUXGwpZ2cmqZj2
 cyLqlu+TwNptFZbhj5eJS0bU+eQ3HarEwiH+y1s6eO0Gh3hr9XzL0iuDMT5yNizrlUOKZ6oPRnJ+R2
 GlNxzjGsVUraP5xTi39msbI0AwN9+xl7TeW7rA6PN8CypMvq6Cw5u+Gb5EpTxqIt04ltktxPpK7ZdH
 hO6qIAMtABkT3ACIed64a3INU5dZnqtgyfN15/EREM+0p31qcL/KrNppdoHw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: Marius Cristea <marius.cristea@microchip.com>

The MAX34417, IIO driver, is using some unaligned 56 bit registers.
Provide some helper accessors in preparation for the new driver.

Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
[narmstrong: update commit message and move to include/linux/unaligned.h]
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

