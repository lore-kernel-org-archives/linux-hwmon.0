Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C65A30F7F2
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Mar 2026 07:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773474544; cv=none; b=cPQUO+Z4Gx3wmR8D07/zcsRVXEqAL01bLre3a+bxmkpMfZNneHdh5XBPMavtMd/vrx8JQR3KKmxAtXt+effXEDFpQn2XSUks5IYpTrPF05VEatxeu9s9YX7YKGj03HqWN2dYhF8jSr6pbqEILj8nJzsfZ8rpG7fbV3JLkw4eLk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773474544; c=relaxed/simple;
	bh=YFooCXjY4vhrFjtrhO5Wz3YV0/8o9mH59H0qInQq+uY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dFglnc4Yg01peHV+fJK+I2rS7qdvdDRUDi1aIZiq6bNjY0qwarW9z7mNu6s58ie5n7ioWBcT2t7x8Epdv//I97O4quIK+zszd+bAe057dKQte4mY+0bYn0zHLyKtl2xiIuOF08uFQhwg7vMb9NTTVKbZTD+z2X+JCki0xzd6SJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8serjfu; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8serjfu"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso2278416f8f.1
        for <linux-hwmon@vger.kernel.org>; Sat, 14 Mar 2026 00:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773474541; x=1774079341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrmvlVXN7ug3In87/IQy31mO0C0nCxbjUjauESYh8bs=;
        b=m8serjfuw4+WUV3vzsN221mKclmM4Y89DHJMl45WCrz9q83h3XqBMXYeJH/P9RCFQq
         hulGBE2RsWx/GRc5StAU+8EpZUwixOVz8cME8bbTfs/j+RvgmEXbgqtglIh1O2nvNG5S
         oFcdIPiBAa/D0WthsZte3gis7TaSi29qAixANxhbKL5Dj4p11dR3FTKaZpNVCAg/Wepq
         so0gHbZfiJkHuVH/Wm4zJuAtk+P1x8XjhzMcFe/yS/9QFtPsR67mYLYIFl3WUaj9o8C9
         gxFij1/Tkw498gsXXAXLyMB5O+NkWUrZnCvzKXntiePBgLMX1dbfomNXchSXkdEgDJl2
         xuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773474541; x=1774079341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yrmvlVXN7ug3In87/IQy31mO0C0nCxbjUjauESYh8bs=;
        b=kRjle6ztZkHH1Ty8DEDFt23wDsn5YiItlvOLmX82+6BtpLOZXryvYMjbocEDj0spbg
         bn9A/Z9/W/6UZo52itaN1Sw87V47zVPlSnZtOVU/CLC7zBl5HTU0wvTnz9zA4sg2nwo+
         6hOtX6CTXOrSgdF4gM1Zxt/zXrSxE045J1YcFuMcqaVDiwICLJvlYRnzTWNdL7MbctP2
         sutrBshAFOKMi8lW9EghTGEgelyp52SIaeEus6ythiSLGEA/P7zZDXL1D2CF7nuOYtJY
         BL/mcblRjFYtn0rRZkk+fdJQNHs5uYm6ljfqRA6JGOL3SHVMcxAzI5B4gCI68waUI7J1
         l+4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwr3R3W3I5MEXCbq3baeNF70z1jHYPtV2lIkUGf+K7G+q7piuBvpUYvynNKZyhFOi2FpL/adwmllVJlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDE0qt+ZEnuRMfWLdR9CgE/HYN2FreYfwG5LoPw70WtnTH2Xh1
	JqbyQOLogMMEqyNd8TqHdvyvGrrPRKWHzbNHop8CE91Uj5Qlm0e0lMCt
X-Gm-Gg: ATEYQzxBbhkkcGUe01UTrllbITHY8uImOGOKt5GZt1hIHf0GZxMPizr77ta3P4cjhVm
	mt86Aq5OjueprlM6iLIvuyhHeLKuvCRBw6ZFPFw+uLwBHpUhe6lt4XLY+RKX/5t1myA5yaZfGhG
	6gtlR5vOdG+QPIlXjUShAdhRerpIB1154gMsarLSzdATqVp3t4jetF90/xxKWEgDYqjPLl7dr0B
	pVHpqFkqktk+Im0q9/ZaEglbJdit01DB9iZPg0KyQxl41byo2BJox9Sx9MT9PfvTfnTH0Wz1fF3
	LE/pee539nvfKS8sntzkBfgbP2/y8JKAVAKLfJbHZtI6V7JiLKZ7jACouqSOEKDjWEB+TeNv8zC
	L4g9heZ9aZBqx9kWbe0qs13Rw+rlCfNW/vJ98Gzqf2tCr/PPLDhrI3aMyq8w5eXKeyS1Q1MOHtz
	PnzoEQKhS/eoE5zjztPk4nIB6yC242p9p55e4HR00byBSp58SgXeXINlpgGxdPfjGTYAbb8bCc
X-Received: by 2002:a05:6000:230c:b0:439:bf2f:123e with SMTP id ffacd0b85a97d-43a04d868d9mr11056665f8f.11.1773474541457;
        Sat, 14 Mar 2026 00:49:01 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.232.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19acc6sm24489760f8f.8.2026.03.14.00.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 00:49:01 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: lm75: Add label property
Date: Sat, 14 Mar 2026 09:48:58 +0200
Message-ID: <20260314074858.268098-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313-enthusiastic-defiant-mastiff-bfe8d5@quoll>
References: <20260313-enthusiastic-defiant-mastiff-bfe8d5@quoll>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 13 Mar 2026 14:26:35 +0100, Krzysztof Kozlowski wrote:
>On Wed, Mar 11, 2026 at 12:58:07PM +0200, Flaviu Nistor wrote:
>> Add support for an optional label property similar to other hwmon devices.
>
>I do not see any support being added here.
>
>Subject is not accurate either. You did not add the label property.
>
>Best regards,
>Krzysztof

Hello and thanks for the reply.
I probably did not use the best description and subject name, 
I wanted to be linked to the other patch in the series).
The label property is already added by you via the hwmon-common.yaml.
I will have to send out a v2 for this series so I will change the subject to
"Add examples for label property" and also specify in the description more clear
that is just a simple "Add label property in the two examples."

Best regards,
Flaviu
