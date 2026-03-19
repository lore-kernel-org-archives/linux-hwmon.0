Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2785391E40
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 17:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773941917; cv=none; b=TlFcUr+XzFzFtlVE7hKFgfWXh7m6bAdI60yTjG+zeqb3DmKzvoTOZB44/Bs+Up+4jgVyciXSL3dDcAmJr9S01knFNGM0MTFQqFhyKKDmJmrZ1Fh/LEy5R25xDYOOoZSpMNqYdS1bBVGFKEIE5+95o/h2Fy+CQuEruXj+LtHNo9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773941917; c=relaxed/simple;
	bh=F9Y9xO9DqV+DTrRKmMdh/09Zd9Svfi3FPfzr+d+05JM=;
	h=Message-ID:Date:From:To:Subject; b=rhCyPvowreKmUl1wsHnWx1f9uRY0rmOjuduL6ahiwS/9XmSJQ+HcZcqnVE9eF7vmBsqxWEeBom0ZzUo9HOQJBHyslUyJ0rDPBUBtrhNPbhZmwaAvKm5wsnEaVihGyxtIoDV/9mBYV4damq90eC8yoBaw7e+5E0PxPXIs2FAtX7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NC2B7ebr; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NC2B7ebr"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50b29c4e554so9963371cf.0
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 10:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773941912; x=1774546712; darn=vger.kernel.org;
        h=subject:to:from:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F9Y9xO9DqV+DTrRKmMdh/09Zd9Svfi3FPfzr+d+05JM=;
        b=NC2B7ebrBG8VHCSzQWWwIrjQ4kJEGr4PS+f6GVlloXOPOq2+WsO8h5Qei9Fu7CCJ4j
         7kSve2WN21NBMSPMIUgwK7EeWxnf1QeIcTZrGDycp09CVfZ20S2PLLVSQ6IdbrXBcFnc
         KMwmvp9WnYuksSCaRcWSjLAP1mGr+hULTNsZV42Bq6+9E/79E9lbr3v8IeXCCdoQoclA
         F9UeVcYPoNGgSiYqOtpLDG3Z0gMEykzyn+R2nka2jS1ahgdxHqDlx60q5O3jVINmA88w
         ipYBamcg0Mt/0yv14W4HdKKud8eATt/Fek9WHk++v9LyE3ooXThAS/EOLPaCdrgl4DWR
         YsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773941912; x=1774546712;
        h=subject:to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F9Y9xO9DqV+DTrRKmMdh/09Zd9Svfi3FPfzr+d+05JM=;
        b=J/P79Od9hUJ5jCzswCCqJyTGVBfJvG/bZXaEaQArS5vXULGR1X8F06XsvgCtjGUjsV
         yVnCOVtAOh6u3iCh1u+K8xK/HUybjC2WOOhABRzukl2kWkRsZfkF8SMsL7yaNJsseaIw
         DXOUHEpogM5MHyWmQ+glmJGXsH2EBmVMf6ddiXn3PgDqW431Qx888L6FRe110pae/zs2
         5NzL6f2JP+/yCUFHqWN7PtmlBO6/zYj9arVBqPgmYJ72q6cePFDht2lAqdcL/e+7tirl
         AKoQCNtY9hTj3fEqT5iSOoUlxThdJgPitE3R+Aab7Mbmn6xUmfLXdRaJa1mQJidMJVVW
         a1oQ==
X-Gm-Message-State: AOJu0YylCS53e0hNJekXDwvaXIWUKLZ7lP9J/MDtuaPQbFt9NEQobKag
	UoEGOLrnUayEH5CJLPUAWel3pBuu3Ckrg9tAjTJGTFlTMTGCAvHaCDqany7tqg7wJIM=
X-Gm-Gg: ATEYQzwQyyW5snh3fs0qy1uugifKVS31E/UCKC+a6lyfIqzW53ONZCNDmAH0UsnrK0r
	TuqRW8iKPU3yd6MajPZ8IN3kAxGkxG3XN9juJfFmaDnANzg49e8SprZhtrM6aUjWoeVJODj7ulp
	tzK+qeEPNOKFOL7lORyQgby0Rs3L2ZQaqXX/d9/e0rXHPhDdPW/tOX1USX+4iwjCSpvw4hwMA49
	7Ub9MB0zDnroY8Mo6ocI3wwu4EvgNaFZYLrEi9ZaypZ8Rn9WbHLZ9ylgRSHaV7Y3mSDC5OWfRp8
	1fUOaZBkgTx1ayyb2iSQHpqsSskn3YcjjzxX16dGWdZjRNyVBfgR/IBD9iOG3TyYe3lbmxttFlJ
	Ipqxzb3oud9w4vu587JFT2KTyUVyoPqhA0qDNdxefuu8W6Lk5bORP63A8wPsm7SIMIWJCqw+2jK
	Mtb1u1uAq6FEdsHevm4CYFHCbN2eqNzIq2nBj0nbeDphI7dPHbkAlgCCNkbdnE91wPuhcVupeYX
	yhAyRq6SYhPnbCWeJHYT7m030GnIY0f
X-Received: by 2002:a05:622a:1e8b:b0:509:3c33:9d2a with SMTP id d75a77b69052e-50b3742562fmr1612301cf.23.1773941911827;
        Thu, 19 Mar 2026 10:38:31 -0700 (PDT)
Received: from localhost (ec2-18-188-34-132.us-east-2.compute.amazonaws.com. [18.188.34.132])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-50b36d23237sm2322191cf.13.2026.03.19.10.38.31
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 10:38:31 -0700 (PDT)
Message-ID: <69bc3497.050a0220.f2e2c.5d15@mx.google.com>
Date: Thu, 19 Mar 2026 10:38:31 -0700 (PDT)
From: jinginajo@gmail.com
X-Google-Original-From: PayPal,LLC
To: linux-hwmon@vger.kernel.org
Subject: Account B1lling Update – PayPal,LLC
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Subject: Upcoming Subscription Renewal – PayPal,LLC

Dear Customer,

Your PayPal,LLC subscription is scheduled for automatic renewal. The payment of 413.2 will be processed shortly.

Subscription Details:

Subscription ID: 9549-WV-1276

Member ID: 84994-7675

Renewal Amount: 413.2

If you wish to cancel or make changes to your subscription, please contact us before the renewal date.

Customer Support:
📞 +1 (805) 609 6469

Note:

This is an automated notification; no reply is needed.

PayPal,LLC will never ask for sensitive information via email.

Thank you for your continued membership.

Best regards,
The PayPal,LLC Team
303 Andover St Morgantown WV 26505 United States
+1 (805) 609 6469
