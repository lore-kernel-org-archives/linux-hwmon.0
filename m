Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882576;
	b=daRo/pBWxlIODUL+S1GCS6Cg6yNDG9bAYE6zb66Qoi/b6HBcdg/x+SDAjy3eQ3T6U70F
	 o6+/0b+gbC12UjcnS556hgUa70aeUVh2sx6zCccmqbkYByL0IwNP/RkvJsDKnia2fZjNj
	 kIzgxsVPyOWGJmDnfNoEOPlhsxakIj4aQszZJiQ1Rp9j2WkuCU/v8L267nKfMDuhYW08G
	 l2DPKIrhM/VWpTFXOH2jwsxO7DralEa4DbBO3kX85mcAOTXYi2N5aNkCE0CR6GP9/I0aj
	 7AQx/NIRqsIBviPAC4cEHBV3iqffSCwNkgJUtsEmEqNcwdHef9Kv1GBRZkdRoa8KxBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=K/V5t+jqFiHhP0+zyx64+sk+HwdaCdpfP+GPzqrY/v0=;
	b=kACJ+kxSMrri7Jw08o7uofMtJYIsG/nSxvbX6KZ8neidwWup7kEnKAxQdyVPpgYIb+Uo
	 KyHrnkWAsl3y9TXijtnzAaxf/HL6CaGqq2gZk0mG/UgnkvFpDPYSkKvCpfY7wKS6vCf0K
	 F15mNsYkZB0kMqHCtdH3eD+4epVVQ3tFcOLWN2rCqsSafX3kbBEgRaNLahRkg0jr9hPn9
	 ClHdRjKbJBXvF1blXCgk3lxAWS016Wz8BoAJ+rbb0SCyuP/aE5bBtmvgFjWbvNZ7oAvwN
	 t+X2VlDgeQsD5mt97w+L72+TyHGxlySBufh0vmrSeuklr1FoF80ihPJ4jgE0+UHdSPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H9okgcbP;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD01D6082BEC
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Nov 2026 12:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD01D6082BEC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H9okgcbP
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e47347279so1074311f8f.1
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Nov 2026 04:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793882574; x=1794487374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/V5t+jqFiHhP0+zyx64+sk+HwdaCdpfP+GPzqrY/v0=;
        b=H9okgcbPSjBNMwvztiZTix0H1RSa93G0pSfDKK6EnbuXehpLZ05M5CWd7nExDKprD9
         KwulzDFWraiuBhUlZCPgf9BOLgFjoacw5op7rIwl/yEn7LoSKjkJxz9u9lVQxnX+tY04
         OvaQPdd/yGsWFkagF6tGZu+u3qxtEFcKULQ1MTgQMXTRRcVPkEFtTpDZMAG0et2BGM2d
         Y+2JjNwLiUJMV3L7/xW9tUISZ2rO/LE/iFZLJW/qFKBD/9eqqvqXPeD/2H9H4l5WFC8q
         4ZDQyXRep7fqZILvwOwqLSEOrFJVOaKZyBXxb3HDXH+DNLtc8tUGri1P++qZuMDCmbmr
         iJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882574; x=1794487374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/V5t+jqFiHhP0+zyx64+sk+HwdaCdpfP+GPzqrY/v0=;
        b=dqOaP4/rSwIuwaHi0JbTWsiE570hyavOL7z2HuZ5TOUAOVyHCaEPDqjrM6XxZY4PXb
         mo2QM1ZrLBCB5tE6e5/f+rfvwIHUM3j7tTyyYnNUtWetiMPuNKKQ7tJJN7WF0i3C70yI
         hUQTER8uHw2fPlSq3T999y+LTgDZnP1o8UF7XlVqsb2+dqU5Qcx1IdWfgEkSAx6k1fcT
         LbAiJtj5HXYzhREfmAeLvIV3RvPAFrWNkx+Obc43ajWprm42iO27N3hpF0tLbgCpUMyY
         kE0ajB94OnvihCt63OH9ivbBuBtPgtKd2h498S80hkH7OtxyAAiX9LbNh8NHwqG93UnP
         4dcA==
X-Forwarded-Encrypted: i=1; AKwUvByA679lCNHfj/Neka5roqdSESlXt6DDmqiU343emGCA1XXAOntg2+2TMdhNKolWOIXKCHEet9TrXWT9gA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/+sQM3wtQRlruWIZLSncshZk3y0+oAakSgfsFJenFqkAQHzc3C
	/d1FPqu5UcFThfFcu2ZGUiOeZDh03WHxnx/h6yXtx5m17hvdQ4AX8KIej9JQZV6Om5CoNLHN6yR
	847wj
X-Gm-Gg: AYBFou3179DddjcH1Oy+0IFura0OeoNDqcDesJi6HrI/fpWi1yaAe6ofepo5AgDdgzw
	K9FfXjCsXn+011dZNkPUqLyQHB8IYnZ8uJjECXavHRLKznH8GFCT9ZIWX8GmGzmFyDNVspl1Dhe
	dtefvYP0PXYdqIaiEqrk/fJUua3Y+JVI4MuBdzeKygcPP72F22JjIswcf/zFmaMKjp4OMz5YgL+
	VxS1W6wWZFCf3fayGzgiqdui+mqM7G3mcglp65ek1tu5cYxV4jbb5AOYC2dad7fDYBzfxksMhOP
	T/Io+dMM+no5WuruI6PXR8qCdAPy61SjlgHYEDjrl89TEvgVj85VQNt9b4U35soxXZAl5C8U3xq
	3yvh0LXi456XzMSQpaImonYlskawPa7NnhhMg/HPXGmCWa9uxdPlyF8KDNQ6LlD7cIHBqor9taD
	A+CFfEuXTqRDWuXk/aPNH86lthx32GVm5APp1qjJWOY23HDFZ3X8aTv5mhEuuxrZw6oHJhnN7zw
	e8CBQ4rrZtXGtLZO3XOic7CAoQ3Odk4Hp+sQyk0k/cMkWa3oGFXcKINeXYrHEoH0n5e4luZeYr8
	k6DwNzIbDVGSmN3PkVM1Y6rwMN5dEfEJ412Jynma/dIh
X-Received: by 2002:a05:600c:6384:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4ac150b20famr423844785e9.3.1793882574155;
        Thu, 05 Nov 2026 04:42:54 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57373f7f1sm73487895e9.15.2026.11.05.04.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:42:53 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 05 Nov 2026 13:42:47 +0100
Subject: [PATCH v6 2/3] unaligned: introduce be56 unaligned accessors
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
Message-Id: <20261105-topic-sm8x50-iio-max34417-adc-v6-2-63b4e8279633@linaro.org>
References: <20261105-topic-sm8x50-iio-max34417-adc-v6-0-63b4e8279633@linaro.org>
In-Reply-To: <20261105-topic-sm8x50-iio-max34417-adc-v6-0-63b4e8279633@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq7HnK9rfw2wWoTGuH+jwP+i35rXB5WvMZ+jpraK9W
 rwN+BIOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaux5ygAKCRB33NvayMhJ0RkeD/
 9cRCQ6b4pl4S+7SXkMrrob6IWUG/2drVzNBJXnHQR8xH/XtyJmJP4IiW7MP/0UJCMYFVDDP78n2nVl
 WYFwPP0zp+V8QKA/9q/fm1I+DzPqlHL+CiOUwV9+3PGROZuOaAcWngkDOETREe7K7WD6wYMaU1r+Us
 BYZWwKRF4ebe/hBSDI2/QNSuo+iiZyzp6xavIRDYoDvVZuxFipN/BGRblJCii3iJ2pgQdHTJ4WrGaC
 KvpvvqwH+PRp+d8jlCh27v+96FGiQ/5HFz9yjOF06Ln8RLsMAWkTWLKL4lOz3OBuPUkF5pVFxva9oR
 D3o0D/Ox/edONKs0iXJOaymctFX84W6qPOFiTtIlUl7wLNI3Y8ozIcs23o6N1KMLC3rLzsNIE7OVxN
 7qU6cWB2jY513+5MzuMg1ec7IqAt8nOWPS3yb1pQGlB2mLsCNm7OfNt0ssQ2zzDLmgx/jn4x3L8RLz
 mtsfIrl41kTbZkRL/oX6IVmrtPYJnk1Z/m2yu8A5GsoceUQZ/8c9Yb0aI4YHKYf2PiGMu38bviL/+k
 xA10jiJ3z74tNJJLywQIcEubAhi8GGUOqldBEuTeevI8hDW1iZlzonH6Y6GB+QmBaK8IxPL5aUcrMp
 1SLU6S7ndwusHEjTQPuxSrut/s4FeL27GHR25oh2cOgr/dh5morJT3njn/oA==
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

