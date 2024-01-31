Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F26185E
	for <linux-hwmon@vger.kernel.org>; Wed, 31 Jan 2024 00:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706660623; cv=none; b=SmgRX1b3hvu9dTR3+BvvNTfxHke6RbE4rvGg2eBeqdY6CZ3W2hG5caNz+kBgV6PKsHYhDrkRJ0t8o37PGXedlr55SKzxpUcwgZdt8RSAv8ImQ50LlqRBgjUtpmcpsfd8xpERMal/MlWbqBYvsKqw16drVqn4Z7ZsHgSZj579Id8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706660623; c=relaxed/simple;
	bh=3Rj3F0vLfTq4/ynJ66a15e/Bdu0XKbUKQmnCGzKFxUU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=n2DA/CBQj7ofNbGIM341jg6r7p4quLL2J0edZekNP99PCgEBc7WEVEkrYSJORt9iAxtkE/HUKIUeZ6FQAkYQuxu03jiCqH2lIRq4zwZD2i7nsBILYSei4t2Y69tyaPPRZscYHuR5lVWmRnRnFpBp42tNUODpBHl00RbXtUOK6iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=PyaEF4/N; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="PyaEF4/N"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-783ef8ae70aso301536485a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jan 2024 16:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1706660621; x=1707265421; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Rj3F0vLfTq4/ynJ66a15e/Bdu0XKbUKQmnCGzKFxUU=;
        b=PyaEF4/NqPfS3c3kEHWRZlIBRd/7/xZKM9qPIuKbVo3RJOwXPrL6KMzLRsIJm/1M7a
         VBDK6AYedaXPk/iMxTLec4UpyLOwlG0i76Sq2M4weGqYFFIC9lGqytbL7PUFJ2Cw9Qjq
         7fi6gqhq+8fAr8297Vuw+csnayFhn/uCkIhbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706660621; x=1707265421;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Rj3F0vLfTq4/ynJ66a15e/Bdu0XKbUKQmnCGzKFxUU=;
        b=UzpKd5TRcOvjbN8tOBE92WPrbxTLHfFuFoEe+653gZPnT4Y7NpaR9z5ATPmTi4sweu
         PeayEjIxdH7jQ4YQCAEcfWVWoVLn4dY6q+o2zx3GBo1ZeKjt7vvce8YemPDueQhTSjGe
         Dh/OTMLDfWAs13BD5vjy4OVxXPchkIkVjJbL8RfKP1d7h4jD+9YEnD8OGTJq3GqF++EA
         6w/0cPcBAAIGFiPmN/gRG4XDehj4S6Rq6T1omIpwCynVzSX8Oqm3Ooqk9qAVz1N/SNec
         EJ+SZ72ZxHf06jRPQBi+cUygfvdse0RnZCyFcvo1WmJ8Wz2+1NDRSFUeNcU20YZR92ce
         9CEg==
X-Gm-Message-State: AOJu0YxE2dKLSu3Bm5kmzkz80lZZ41T+vIvSF1fuXCNsftJvpmSJxgYU
	9ElQvqenDrQC2OiOXQoVcPZmUlloP1woBF4yWRviB1OGvEROK5kkXlZ1GTx/6OA=
X-Google-Smtp-Source: AGHT+IHDeLHxsLl0jVfDYP5QKiXxJqwSK3+ZDSQa+cDd5nZ4qk10qTUH6lAMjTkuKwnyS0h+WDgqHw==
X-Received: by 2002:a05:6214:1315:b0:68c:46e0:78d with SMTP id pn21-20020a056214131500b0068c46e0078dmr172271qvb.45.1706660620930;
        Tue, 30 Jan 2024 16:23:40 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id lq7-20020a0562145b8700b006819bb31533sm988523qvb.99.2024.01.30.16.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 16:23:40 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: linux@roeck-us.net
Cc: corbet@lwn.net,
	hdegoede@redhat.com,
	ivor@iwanders.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luzmaximilian@gmail.com,
	markgross@kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: add fan speed monitoring driver for Surface devices
Date: Tue, 30 Jan 2024 19:23:37 -0500
Message-Id: <20240131002337.6122-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <975f0b2e-5cb0-480f-af96-b0bd5004e0b2@roeck-us.net>
References: <975f0b2e-5cb0-480f-af96-b0bd5004e0b2@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Hello Guenter,

> What is your baseline? It doesn't even seem to be based on a mainline kernel.
Ah, yes, this is from the linux-surface kernel tree, which is still on v6.6.

> Please base your patches on the latest mainline kernel.
Will rebase this and send v5 shortly.

~Ivor
