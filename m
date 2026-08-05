Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A992BB17
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 00:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785891446; cv=none; b=fdKo177py/rjI0Sgsrn9w17jBRIoc3XdT/vyDUNa5ZAi2wWOvhQsZeOwOwEbwDO5ugCAsxvSgPzlxt5FZVMloPp3VTrUzusgDfeWBNKn2IJK1h+SZHWeGj42qAY02GDuF90FLEAWjJ5MOG52BF5cb0JPqvnxf+EQwnwoJnU4OZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785891446; c=relaxed/simple;
	bh=BZia9IRfim+aRzSJH6ncPkXvqUmGvZIQh/1hietUIpo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IHlAoXCRhSGWPTStQ16PgRqKoHBnZQ41MEpmssLgny6WC3gzUpdwVRhckLV3o/d2qo4UTzDbv6UF1By80SXIuFEXw7PSJmecp2TUpAcWRkRFC8t+5Iv7KNAXwFtv6pnfGKeRynwYpugt8TeGG5u/+WoLdTSINmY3Yqma+HKLgIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSZt+YrY; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSZt+YrY"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-382ef647e20so439762a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Aug 2026 17:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785891444; x=1786496244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RsYewf2KBUISi0zaIR4fuAmeC55DtW5sTqD/begqigg=;
        b=kSZt+YrY2keco8McUsXzrK/jn+w6jSRGjrKkewOkljjEqiRildbbg6Ud+Jlux4PLCu
         MXFSFgInllPu7oKAkzIzV+38WLW5x5nZSFjSwgw/S8ZE40Keys/V2rEUDYT0b6LtBZml
         EBHrAn2+TXTsAczWrY+wd9U+rH5TIhjudd3oS5bjiekhpxgXP45oiGdLYywuWz9DXC9Y
         vD1QKLAkGW5YEUSA+MSnGnc7wNWs4z+FiNhvUlsnXJ+pk/4u7++6I4nW8mnuft9yEgKC
         EQa7O3FDRvxN0iYB9O8M7jY18NQjtvZ425PCv796JkoXNXnOLywiHtkpokeBZcxAJhDn
         JnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785891444; x=1786496244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RsYewf2KBUISi0zaIR4fuAmeC55DtW5sTqD/begqigg=;
        b=omkLjjeTkGspKLEyyUElCvlCvkuBPurcCH0c+sgD9QCEpm1SbizpVBBgdT34+BeixZ
         ly9NmHkOr0HskaCdWu7k6XguU2PsGFoJ4znZtuPZz7nawMpSPLkGPS4rM9K5FQSBxjRB
         KgEgEHXY2bDtVM01y7NlsMpE/wMygK3mzDuYigvWPEq+6bScqo4hCWnF4CnhgE0JP9ht
         c4lefAk2pYcvbxK11/8KYnYOinfuGIvw63wtXzDITkNHKVX9JiUhG/Kz9gNEbkX3qIw2
         vbWVYqKX+ZBKM0tmPw2Pl27arx70MW2TMAT0zBziC9iMjXzUkYlZ4hM3mtsIh1WntgXn
         /6RA==
X-Gm-Message-State: AOJu0Yy+gcKK3PS2lPdsdhtpihtk1h4y2lBEAoYHHJQNhNLnmsgQBJgq
	jhCKc12sO9WKvlyHK19eDUMMAe5ydhAnyXVTJIm6Ud5PhlqjCf3zXy6TnjV2LQ==
X-Gm-Gg: AR+sD12WKZO6JtFuemGWDJEBnPuRJmgtoVEtBI4qPSjx50JVxon1xulhTiVTOVN/3mF
	rlP8J7PrNFJyMLalLjlOzupvn1Mczyvdx5td6RAY224cSDFs/nL2W7Q7QxyHK5UbxI+I6l9CU3H
	VBiHNN5fza4nWVm/N/pmO/d58CaVMXZWO3tBINX0bZYd0L6V5llwYg7TELWd2b6xtpnNQNy+vFG
	k8kfHO2nDAnubBbgGQMMasegdjq7vPbTKpXbu5PLWHEZDE1fWNIJ2Aiom5uD2TqnE58uuGQPXCj
	uKhAK9+S7hONwyCbDgRYCYM4E1eRpo4j1ziZDh6+64e9IuIc1bwWhJxCIoe7nNGqTVmPQVQzpcS
	FNizFMWPR5OkJL9k9QskesYPTNxqhLX2gRinePOAa24ifr1duu0mRw4J3vSml8r+JFBpwl1ABdx
	K02hNziCj/LUpF5wezwTxObzhiSvFygnGTTkBJNUe1YhqwxzOt5cmCxMpJmKRY+sO0JK8pr4AHP
	g==
X-Received: by 2002:a17:90b:5484:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-3903c581f08mr3168574a91.10.1785891444421;
        Tue, 04 Aug 2026 17:57:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b0a9csm13047693eec.2.2026.08.04.17.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 17:57:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Nuno Sa <nuno.sa@analog.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/3] hwmon: (ltc4282) Fix issues reported by Sashiko
Date: Tue,  4 Aug 2026 17:57:18 -0700
Message-ID: <20260805005721.1566034-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series started with a patch fixing a potential overflow issue in
maximum poer calculations. Sashiko then reported a similar problem when
setting current limits, and finally found a problem when evaluating
adi,current-limit-sense-microvolt.

This series fixes all those problems.

Note that Sashiko reports more issues in this driver. Leave those
to be fixed later.

----------------------------------------------------------------
Guenter Roeck (3):
      hwmon: (ltc4282) Avoid overflow in maximum power calculation
      hwmon: (ltc4282) Clamp negative current limits
      hwmon: (ltc4282) Fix parsing adi,current-limit-sense-microvolt

 drivers/hwmon/ltc4282.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)
