Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF9519E992
	for <linux-hwmon@vger.kernel.org>; Sat, 17 Jan 2026 01:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768614799; cv=none; b=mfZtmHV3qfCI2h7c7eK7RiV5hpOVbNK0NwBqqx1WS+JE+1rwryFNEqeKUt+ACpBzXqIF8LwemwpVw6zUqSrGioh9NNO09Kkpay95f1+rQf2sP8PdTPQsBrNWRLZ0Qgp5B1cnPkTZSa8PQZwWWnFCUpFthO4Tv0mnUzHLcwnXwKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768614799; c=relaxed/simple;
	bh=xeucU40Q9U1ORWBrd1m7fADOvmchicV0iR01vpTjrKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X8LCBMM+ig6zAEPaEgQ3/OR4MgmNBF3ka/+/ZAN5umJdCeJIwHeLF/PecHFA/Oh/7W/dU2J0caS8n7zOVceCbhl88hD7luMvR9PNdEtQunHhgSRlDmlA/FwKDY6mSadraLHqUFIq3dk8VhHaEeiM/pHAq+9hlTHmV4sCE/4c3R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKi+ua6P; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKi+ua6P"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c6a7638f42so219626485a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Jan 2026 17:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768614797; x=1769219597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26TuOQYfA1yIW7S6RDEpftu7FEUwauLf1iAurO70fJ0=;
        b=NKi+ua6PTVpO26zjPb/95572bKQwLXLt8q0c4+M2/5RubmFDw1eDqiufQKgEVLoP4l
         gkenCF4R8PX5jGtpfNYA5dxK/GtahoSVdOpuGwBLF6VeWrQzUKtsV7UUINRnzCMTu6Wf
         SH+vKNmBHzTbqQKE018aJu3NpQZO0Nh8JNVFs28vYmnWjO0e5LeAsVdHuErwt0IuIggM
         RI2qvOsh4N+/KijPvd+9/fvA3lXelDgu7DOoNV+rvzmqOZM+hc+3dsH9OiGnVbT6inaE
         S+wa4gRxEv6M1uHOq3BHaegQUMNYuFFfvLp3I2TZR3AFWwEFMAA3saw5N1xv8dD5pLSP
         zUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768614797; x=1769219597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=26TuOQYfA1yIW7S6RDEpftu7FEUwauLf1iAurO70fJ0=;
        b=MOTwSeQS03SNzQ4Bhj4qr7hMLnu45Vk7t7IBnIp/mrqqYB4T8i2lJB+rbs7FMeDEmT
         sPdH33diJbycTMUG9d0IIfMLmrbFuMMvm0vINfG4BP8hNAMRR9CgwkcpBn6MZY9Ct1BG
         s4MRlXJabtqCZPiSxR0g/Z3CtrsxnjWaPVU64tPKheazjySiA/SXFnOZ+QR2gXGKaO3T
         XqHNbjxTN8k+hWZcgn3CMkRlijMuPLCjmtuEayb7c77qk+SeMiTSEIkwxr1ohbDTqd7u
         1yIuh0AxMGsuoTaERUKqDDHdKfLR60Scp+n2SZGrItFe35OQuDd6TPt6Z60wJgjnjtxO
         5GAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcD3PXgYC/ygUJ7eqiZLPLBCXR2JC6omFaXKomoVTjynBXsvfANs4GOBcQdlw26Z7LqynomP+46s4rVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9dF+h+lvbZVHM8dRQkwt0IWf7PEdAh1VRCiQdGGLzu/+b+30o
	fziIcCJsZdPoAB9aCd7vsCMUXJ+bBdbYLkXio44FkJ6nKX5J99AuYERN
X-Gm-Gg: AY/fxX6oJIkQVVsKy+EmDFoLkNzYw5zY561iSY96KGRQqRgHwQumn6q/XYUjVs3jeK1
	54fkDnRnfN1djHbSsT855qAEhBLOW9+16XpZoUhXglhvA5aoWYwDbcpD3bZEHAjiAkZZdMl7gg8
	AfMf76WmjBj6sLfJGfd4hakcOmeX+r9fhDhMbe5LNjYHrjrxDOvKJ3kONfdEVpYmXLFR9iuCd59
	TJEqxU5JQEVxv/4DjckKD/N2bezZQRRIEll7m8pnQ7+IDMSdHJyhW99+xC+yciLqxzKnL82v3ay
	qINLCChOMjVU2pBik+W8TLPSUspd/cUV+D2uS1oorezoDXshUP9cdKDeBBCeJXv1+9wfKojBeNF
	rcWQfH0jGF2bQ3AoXDs7oiMmycGe02CExs5Ekspb1OuWXMzK8Hait0z8szdkLj9O2C55tqdld1d
	Imb7yPl4dRjA==
X-Received: by 2002:a05:620a:700d:b0:8bb:1a5b:5a47 with SMTP id af79cd13be357-8c6a68d3585mr662066385a.17.1768614796989;
        Fri, 16 Jan 2026 17:53:16 -0800 (PST)
Received: from melody.ht.home ([2607:fa49:2104:2e00::983c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a724eadcsm356917985a.29.2026.01.16.17.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 17:53:16 -0800 (PST)
From: leobannocloutier@gmail.com
To: linux@roeck-us.net
Cc: leobannocloutier@gmail.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pali@kernel.org
Subject: [PATCH v2 0/1] hwmon: (dell-smm) Add Dell G15 5510 to fan control whitelist
Date: Fri, 16 Jan 2026 20:53:14 -0500
Message-ID: <20260117015315.214569-1-leobannocloutier@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: ef59dcf1-5a53-426b-8c17-00ddc8fe5d11@roeck-us.net
References: <ef59dcf1-5a53-426b-8c17-00ddc8fe5d11@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Please consult Documentation/process/submitting-patches.rst
> and Documentation/hwmon/submitting-patches.rst before submitting patches.

Thanks for the links to the documentation, I tried following it as much
as I could, let me know if there's anything else I can improve.

I tested manual_fan and auto_fan by using `sudo i8kctl mode0 manual`.
Manual seems to bring back the expected behavior where the 2 fans follow
the fan curve described in my i8kmon.conf, while automatic brings the 2
fans to full speed.

Link to v1:
https://lore.kernel.org/linux-hwmon/20260114020108.83288-1-leobannocloutier@gmail.com/

Leo Banno-Cloutier (1):
  hwmon: (dell-smm) Add Dell G15 5510 to fan control whitelist

 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.52.0

