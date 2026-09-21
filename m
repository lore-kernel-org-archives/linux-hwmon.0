Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0C34A99D6
	for <linux-hwmon@vger.kernel.org>; Mon, 21 Sep 2026 15:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005982; cv=none; b=fHVPkLMb4aAWaUyrJc5+Yp7eQQ68LRMognodpvsDrmxowZpGTQHgar8D0pIhfyd/YOjkNFrg6aOafnbxva+elNyGMqCtqgjzw1JkLB4IIeJ6KN8yqbI2EU3cqkSwdFSiwxyqj7XYVzpK9YEjHnuHe9koomYutayn4sLA4UuCWCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005982; c=relaxed/simple;
	bh=uxSodr+5g5LhPeuMJLPaJWB2Wbyi9PA19/nxsZvoglk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W3axWNjwrdc7YwXZyOMGFE69brRCIp994u4ovC2uC+c7lQsgfzpM71b86I0VWIHyMwbP9ab9dwmmeD3IWLQzkSUIdA2VzEMGF/Egq0ss8CmPmuT2GHL3zTebJ+z3sTTUVQWqQGRGLoPKLSgBX1NEfIwTXTBeSVTQUB19ws3mnyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCwdd/EI; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCwdd/EI"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so1930117f8f.0
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Sep 2026 08:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790005978; x=1790610778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G0ME8UIp0+YWwCcJhu2EyuXifWZmH76ARjccb3bgJVA=;
        b=CCwdd/EI0Gnxf3ehSmpAf+WKHqxJuT/SEdiQz6nfa1BSrXAr3lvGDCbqI4Q+aq7M4M
         gkNeeewB+SQZM7xPtR1rbcWaP5BJzlA5eK/VNnVLgCqodKO6f40egdqKtB1716YN7W6I
         ao17i0zNBWaGwe7TehZfRSvJCwSlqz5izCRrMpuxe2IlypAV1yGJ20Xj3QQf50T9c4Qn
         9mH8UXQXMJl6gBNJ88qk1zwg8TRfqCfosA68LFVZ7eQVhlkg2HhfoD8dQmf2KTx1ydCX
         dmBNAifocPTsZDUGwvK/mddW2jOVubu2DUB+ri6LZStUSCBA7/Hvmd6zxBU2YidTrIdS
         LeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005978; x=1790610778;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0ME8UIp0+YWwCcJhu2EyuXifWZmH76ARjccb3bgJVA=;
        b=09AUpZPQ5LDJivbs5BIkVZnA+Ro2rZxwky2t/I+syrG1We+CXlfpKFWgbqX4AsYy74
         y9S4igLC1lJmnVK+6X2k52CQAPVGZePZbZPZqo5fzRRTCM7CAfGchv04psR743NrAEaw
         lKzCZmBSshYuMhklRI2tPMw0FrV/GzYjQRRSALqqssFgjM2uvpw3adAUBbybo4c03G3P
         TkA6bu1hJ9CBdBYTa5JHK2ocAwaFCoZrMzskRVzEgdBUgmqPEsC+AJ/psYPzJpz3v2bO
         AUAT3m3LoNimGVL1EQfp9SF1QXx5Sg5gCQq3hzIyuONG181DV/EpaRC2rTwJecsdi3GN
         x51A==
X-Forwarded-Encrypted: i=1; AKwUvBwaPQKr40ZVf8uTZyXFyWEmhb3gP5rUhSD9xHQZ5iqC+emBbJfxrB9pludsD3WlHtpv67dZbj0yDabyKg==@vger.kernel.org
X-Gm-Message-State: AFuF++lb6XhWAWOSHGY+T1zVueZRkqVakffKgdjTljpIMi3ALMXr3OQC
	GdrRdVSd5nV2tVGTXO0///KQKQ4V29SavMW3iCxen2521ngshDZC9nZo
X-Gm-Gg: AYBFou3Vdc/FWKDD6m70l7xkhghtP+yXGMmQ6SYeHHLeeI3JPD5FYrz9OURBBSSlqpc
	JVX0CbrNLLWpX+y+kc2HJGDyx1c84yEdsaUUjVxJIdSzg4JRh0+W+aUNOMUZgGJ7+0zCPtgpdPG
	ZSJc5io+ajXclizyb9FhDiqhu1bn7+DVyPSgdMUkXGtaNtg9Ii35pQ+We/LOSQVgBmsc2E8+Sdc
	w+iEiD81vSFsp59oINryOVq/yMMQlnuwi6xUT/f/SgrzebQdQqeNZyJPaJmmXkDbR7AFnpy4vyx
	M8AoGkKVuUvvXZYpNiRKuNkNg0h2b66h6wVcpUs5YVOLll6UtfGcF1qE2Jk841CSa6mDkf3QTAI
	YFPJYS9Dr2OHmUDBbxPgf8eN68xc4xmH085k0xp4c/oZAElYzXKMip2FQcrKxacGcpn2BNwDcG0
	UK56Vzgj1lRLrGWkbH0G11cihsrQOVp7cU/MBtgtFLwRc0UNvpJkH9SxBdqmPUhS44cozeI7ERo
	H1kk7+Ul5FQ+HRYBhELRA==
X-Received: by 2002:a05:6000:430d:b0:487:27f6:a4d7 with SMTP id ffacd0b85a97d-48727f6a748mr10341971f8f.39.1790005978215;
        Mon, 21 Sep 2026 08:52:58 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4885a0549c3sm11159401f8f.25.2026.09.21.08.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:52:57 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 2/3] platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC driver
Date: Mon, 21 Sep 2026 17:52:49 +0200
Message-ID: <179000596924.25968.9295838488330037392@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <55181989-11d7-ce0d-f9c3-e9dceaaf1fb4@linux.intel.com>
References: <55181989-11d7-ce0d-f9c3-e9dceaaf1fb4@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

On Mon, Sep 21, 2026, Ilpo Järvinen wrote:
> > +Date:		August 2026
>
> ??
>
> > +KernelVersion:	7.3
>
> This ship has already sailed.

Will be September 2026 and 7.4.

All the other points will be in v4 as well:

- the missing includes added where the symbols are used
- the cache and stale periods defined in milliseconds, with the unit in
  the name, and converted to jiffies at the call
- lockdep_assert_held() in the command path every EC access goes through
- each EC read checked right after the call
- ARRAY_SIZE() for the cell loop
- MILLIDEGREE_PER_DEGREE from units.h instead of the literal
- braces on the multi-line returns

Plus two things not from your review: a shorter i2c id that fits
I2C_NAME_SIZE (the bot's finding), and the symbol prefix renamed to
slim7x_ec to match the driver name, which makes the v4 diff larger
than the changes are.

Thanks,
Oleg
