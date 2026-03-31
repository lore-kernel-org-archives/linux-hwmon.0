Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC73F376BE4
	for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 18:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774981205; cv=pass; b=ikM0RbNUHX5SYO7m9QUqEdISPNh72B2L7WmgGFELyrP6+2/WaCc7WQru1cbi+RPRb/b3gTdlm9XJ+h8Gk8H8yU+tEsXJUtjQDVEvfrGq41++VTDvt3Vu7Gn8uwPFIcFoqQutuS6tF4X2eejyn3ijBXFv3l3eTClrsDBpvYB6YJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774981205; c=relaxed/simple;
	bh=a+30APoIORDh8Csq7KzYsvB1GDrzthta36+VO379zXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVoCOIdlqFnpYWtxdmuyncOKw0nLUgsoJLLxEA52RUkUpYWa1608xIPX8y+zt1/ZET0kzfTXE+ea0rLivJsOxvvF4q0XAtz6pXWzg4WId8UTCqW/A+c+zvqJMB5fwuABPdWYT8LfwAqYafNIF8PS2IijJ2/RJhfO9Jwc3JezwJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sa1+yKxu; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sa1+yKxu"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35d8e548a05so4093777a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 11:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774981204; cv=none;
        d=google.com; s=arc-20240605;
        b=bIa1IWjdJDChoDej1m5Xyg9ZlqWRK4qINPHx54Qqvr2frhJ8lbs8Xv6IcKpW8Le2hn
         HxbTUA5qs9AozAnpoixMLF7Wc/h5mznu/2C9TafcmFA/3OOAwgsaBsiSKRigqJHl7p99
         0pnj+6vLEI1zNLoh53gYm7C5UkXsRgEheSq5NHP8/QSsk+97D9ghOVkRdk+seem8odjQ
         RnYB2+/fXE59h7KGWUN64zL/9TCzjUySuWlsqQbIFChYLhzQ7ajLeoDjRva0ASbyqS/G
         E8O78PkiWCBtjAUhT0zxdw0D/9EVQlur99JJ4bjmhPeVtM7QpMrXglAPuwcLLUcwnBkW
         a7dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a+30APoIORDh8Csq7KzYsvB1GDrzthta36+VO379zXg=;
        fh=mRGY8+t/LyXGZOFCTWWjhx16k5+wCJywNTdMvtCeRwg=;
        b=Cm8wkWLEjTpdvk/vQdznhdNQ3L77K8tUq1XiTh3ytK8zlOXnFqNTfMmcRx2CWHMlH5
         xT1dYAmEkMscKozZ5A7HzmqWgVx2AvOe4X6s47OEaAFaRBy2wBkoU/4lKw9/h5ALUxNi
         tJvJdtzSdcBxKN7TUlFWNCR641KmCDU+xm1j/rAbYsi/U/Wpx4UBINozv0tkUhlKuVMy
         GkTB3sUSDKbHAWtwS80bzz6sXrDvYJprN/DmO/8bZMXi7i2krPFv5W4b+xadHprHMG4W
         wjChJ30m/pR0spYCUPF7tg0jrkZXHVNytJmFI8ijARxleNkgbUF0cqOt+Ka4KqZ+V6m+
         3o/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774981204; x=1775586004; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a+30APoIORDh8Csq7KzYsvB1GDrzthta36+VO379zXg=;
        b=Sa1+yKxuzaQY8xDutBOL16GMEmtT6/6vKl/AkSQaZqgw+D2uxMoiGiTi02nY4EOCg7
         7u00WXIthusvSuJc0l3MepRCxRLudDWeUxuOxVFdlZ8de1kuZJegb3nRP8K20iA1DkFG
         6SfKbvrTWMf9sRotUnEd8eZh9wTrM38zZ83ibsbBlgRE3eukN40MeJlMs/W5PQbg6pAD
         Ee5uXE/u5vUDDORVRZVmvTku66v7Id8y6Bn2wp1aGnpd6p728GF6DGxxgoSGrC7/CKVr
         iSCjMKyH8amJqOL1DG3cB0GQsF7vDQOjC3yEV9QXkef8SezCHv2HHBdKVhBvgVoBTltM
         yz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774981204; x=1775586004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+30APoIORDh8Csq7KzYsvB1GDrzthta36+VO379zXg=;
        b=j7cVE9nsuv238vY4p3cfYe8enQUFPK+HoTPtorriPx8hC9sGM1T3lvtzRoJlZvX4ZA
         ew8PQGksB+/aHiop+xNO6r8UitLCnSul0CgcOWcNWNuwHkU998oif/7i6HJ06KtqWKLx
         1T7PCearvI+gGJ7Hz+3gX7TM0Lue/3XLYgf4sM27lf8qTO89OJstp6ev6mgSm/UyYATR
         bjimzbJgHvAFsPF3Pjp6dKrU8GKh/td76vMeXAWI5kGLjYTqZw1mTjHHGqCRR+wHS0Gn
         7y9mZPH+VxnFLLJAuOn1tA7Nbpx9IgKM/60ffTibpgvDk6ZPbAGP/7H9uW7ZmGV+hPVP
         /h6w==
X-Forwarded-Encrypted: i=1; AJvYcCUTRg5LbUeqIbZLIoif/9Y2HunaGCoL0sC9m9FM4hAAky1IqSrusKmZWDw/ZCDR/clmeFqz9+TJYFpjww==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe3zcdTsUp3CLBs4nEEhULG7NQmhjDxw/aaJbXGwhVQ9ILDUsx
	MCsahoLA4ZjULMncJwFKcJUjtCz3a7wBNFeEQyyAmyXeMpX4Dfoc94odK4PQmTqxAY1YbYxj4qW
	M2wL/duLX0R6U+42PjL9v2ScNUDV0+7e77VjN
X-Gm-Gg: ATEYQzzkON57vlZ1gM2Gx2TpnJOzlCg0DzxlZUq7TVAT13rmxlKhj5/JC4GmUOuUM9k
	UVgDZiTcPAYRRtjYzvvTUXt/kX8M2UjBY8ay5uKVOwKVtb0YP069jW9PoBEVRCpWuPt47ibwZvm
	hH9LEhfPjIIB6jTmsktd7MzOtWHapL2iRdqrHiTgYrnAycW0YxXkaF1Qu5GpCuyPQUKDhCSveib
	kPGj8yOlm6OetT9IhS0DtQjdLdtkbvLTMV8gqksKUvJfY4Is0R79pzYeAV0vPBhtXTdPinSA9s7
	SPfDYB/Dx1lIeC7+FheFEj5MxbehU3Ow2jYCFQxq
X-Received: by 2002:a17:90b:288e:b0:35b:9720:98d0 with SMTP id
 98e67ed59e1d1-35dc6e7ab9emr369618a91.5.1774981204047; Tue, 31 Mar 2026
 11:20:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331175245.354188-1-bugfood-ml@fatooh.org> <b31eb77c-0106-4163-928f-81e521c286a9@roeck-us.net>
In-Reply-To: <b31eb77c-0106-4163-928f-81e521c286a9@roeck-us.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Tue, 31 Mar 2026 20:19:52 +0200
X-Gm-Features: AQROBzBcvxE4fMRNXptEMNWVh5M3Iae0PcaafGKA81sZIpky8ktSsXwFDwbjfZk
Message-ID: <CAB95QARU_8Wu35S3pCQta3L=SM7Z=5ehYZbzxDrSzeuRb3o-FQ@mail.gmail.com>
Subject: Re: [PATCH v3] hwmon: (asus-ec-sensors) fix T_Sensor for PRIME
 X670E-PRO WIFI
To: Guenter Roeck <linux@roeck-us.net>
Cc: Corey Hickey <bugfood-ml@fatooh.org>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 31 Mar 2026 at 20:08, Guenter Roeck <linux@roeck-us.net> wrote:

> The above text is appropriate for comments after "---", but it is not
> appropriate for a patch description. Please see "The canonical patch format"
> in Documentation/process/submitting-patches.rst for information
> on how to write a patch description.

And perhaps include the "Fixes:" line?

Cheers,
Eugene
