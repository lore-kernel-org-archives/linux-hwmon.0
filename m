Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5446E5FE
	for <linux-hwmon@vger.kernel.org>; Wed,  8 May 2024 13:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715174970; cv=none; b=pC+SClu3vPDIX1iSjsikwqAl+IHx8m/9+3Ujcq84a4DdfYceLkjgRJ5pqaat3fqCPMB22CPOiQRmqPezBywU/qGkCWWKAWPvynkvbthIcTmi2A+Ai6q8NbS7J/9qheAPf5yDvFAsvHmlyc2sqQwxhsZOa2g3xADReS/I71w9wFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715174970; c=relaxed/simple;
	bh=1cJ8ssT3vvO7AC0GCo+L+PCuVGXK98IxVZciA8wvK3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZCLW6Ld7BRnnTULkd9yuHf/dkK9297sBHWh8HFpUn1Y4pWqcJPoCIK8+BuwnnSJzw9ZnTTrp8WAkFV/M8IWHADOQzNUq8FxQmz9J3sjZIpPvmVe7S0BzWnyerYlaYrwZB4jxf+qRXMB8gsrv8kAOoDTf6N6cNIUHou2XeF8r3SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Co0kvG3Z; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Co0kvG3Z"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a5200afe39eso1152816366b.1
        for <linux-hwmon@vger.kernel.org>; Wed, 08 May 2024 06:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715174967; x=1715779767; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1cJ8ssT3vvO7AC0GCo+L+PCuVGXK98IxVZciA8wvK3Y=;
        b=Co0kvG3Zs8Ube0yuedNe0EGJ2nfWvcKtEvb4Stk2hxB9J3N4Seu4WQ+Totrx8TnW+o
         qdA5lik+UpBVy1Xf7f+sQTWXEpj9j2cHZbykFa2QAw502Yc8wu/WMCk1fAmuQSdFlmuU
         3KrnkQzA80cLhziYYF4t+vWIL5VPHzBci6+yjxVFkOBaWTu8YRcKmWCJTamza10wHslk
         KMa7jE0fl6C3SqMLtV1eUUWkqrR9eASfjfyQs3YIS2ncwNQlzdvhCXoQAzck8Nh7bj/V
         957XSOw85pnwGrK80DT9GMFFr9qMgqcR1FPWAAqK+nTrCiKlJwbTR3i2pE22RXlhzvsk
         C3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715174967; x=1715779767;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cJ8ssT3vvO7AC0GCo+L+PCuVGXK98IxVZciA8wvK3Y=;
        b=g9Qu/zcvlVEzypyaplVwwnzBtELv0Kwjp3LjsXQNh1LHnkmExoWVBPCWCvRaqLlb0x
         KdjXOiVTZpGpR5Ci3hyymsVlrW2ki41fIChd4b3iZYtTclMIPRphoHaMr+70iMZLI4iV
         TBLIJ09Krx5D1ks8csZzzmGckNA0nA4AwgIgnPB64zjPaykJYv+2pqMvNf1Ke3wUyYmk
         9QNtdQc7deg5v2C7diKPoT+c/7NfvsuCUIlvs5YyODaMz1yWcYh9XzVlz5dNFxT7cacG
         fsRYQHMXGTwN8Nb4sAvUcgcNJSof8tzUm2NNXxMsfOKiEoof0FQk9NIXEnwQmejxOKGA
         M2mA==
X-Forwarded-Encrypted: i=1; AJvYcCW93/zqFrG1MJEeG0lFkeEfa/IOO5b/a8FmePWU16NoIkOHRGbFslBfaMrVgeRvkrHiybVW78ghvLSlbbrrCPK54hpgHbP70qZn3VU=
X-Gm-Message-State: AOJu0YxNsc51RQ1CT6gBNO0q5oySbC6CtqijZ2RzGSm0tfS7xYCshPsa
	v551ND7iLT1E5Fr40DgCuR1+9Kt0iNO3iKVLIZui5jOvdqwUZX3Qd0QflpLgdWFJ2k6S2mbbkt7
	DD99SKGUF10SuMd05/Hq5E/OCTP8Kvw==
X-Google-Smtp-Source: AGHT+IEcnL2YSzxQIOEeckMrQZ7bfccfS0AaAfDdi/Vuqs3esB70DJSAkIP3cUnwKzxvF9Ae1Xv9VVG5KXSoLBAd528=
X-Received: by 2002:a17:906:240a:b0:a59:a7b7:2b90 with SMTP id
 a640c23a62f3a-a59fb94b12dmr225253566b.30.1715174967320; Wed, 08 May 2024
 06:29:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240508131837.684391-1-lars.petter.mostad@appear.net>
In-Reply-To: <20240508131837.684391-1-lars.petter.mostad@appear.net>
From: Lars Petter Mostad <larspm@gmail.com>
Date: Wed, 8 May 2024 15:29:15 +0200
Message-ID: <CAC-Dm24HZg1dNYvdpSfAAEWPLR=kPJC6E_jhTYLYG7U6tUVGiw@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (emc1403) Add support for EMC1428 and EMC1438.
To: linux@roeck-us.net, larspm@gmail.com, linux-hwmon@vger.kernel.org
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>
Content-Type: text/plain; charset="UTF-8"

This patch has been tested on emc1438 only, but emc1428 seem to be fairly
similar. I don't have access to any of the chips with unsigned registers
for testing. Maybe somebody else can test this?

Consider this patch semi-RFT and semi-RFC.

Regards,
Lars Petter
