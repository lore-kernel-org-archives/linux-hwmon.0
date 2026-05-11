Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3056747B408
	for <linux-hwmon@vger.kernel.org>; Mon, 11 May 2026 18:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778524468; cv=none; b=kAB9pnXky2Bbfkcm/jqP4g1+413TSwbgBUenznXagiozkUaYoyNCEwtmcNddel30F7eDKI34iW8nyUBRd70MjVPAKZRnXE3C9J6NpqFKbEJyk0YNVZptJY/UDehH8v06KFDZIWqoFlLPhp/5f5Jwe9VmeBg13l01SSjJAUGkWEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778524468; c=relaxed/simple;
	bh=urLbkhrXcB2JAq4Gd5AtupCqE5T3wdLFHDMIW5jRnCA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iDdjC5X343n3JUZPEMhH8XqeJ9MMiSax6X9JSIOu4EalqLyIT9MKo5doASeGrSfXEyvVh2UQXN/9X6tl/O2YA+PtX7NS78e08zUzF+SbEVgUnr+0IrLGUd+Ifff8ZJlE6g6pew0C6lybZzNlzbmjYS+mMEYyB9GwgaU6rZPScfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Nv13kF6i; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Nv13kF6i"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso5132820eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 11 May 2026 11:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778524466; x=1779129266; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urLbkhrXcB2JAq4Gd5AtupCqE5T3wdLFHDMIW5jRnCA=;
        b=Nv13kF6iE5kwg+E3orOe2M1EWaeXSYR6x1wl8ik+Kdzr+3HEg5za1ch4dLHESIYESt
         C39i/UZ3DQKDV6zc6Pw0LV02+bVitUoyvbIMNgTXZ0B+r29K0hA8mzqbBaO2lWVpFIoB
         5/YUhU9smmm8WtrOkQzr57FvuJcxsz0LeOviD/NdPhM7pOiedW2qUi/aPdHMMq+vvitZ
         IK0LmSasLLvsuFpTcod7rPH+2w3Dz4fNaFmmyqzoN5kNH/dB6VK35sKMY71dEG2D9P5A
         q8bw+jzAN1QCZl23USMV/WTjEc/ABX1yFMLRb+T+x+guC3zvaFYuZQbGW5+xAMpPmDHO
         gNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778524466; x=1779129266;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=urLbkhrXcB2JAq4Gd5AtupCqE5T3wdLFHDMIW5jRnCA=;
        b=p4T8ilnMJVFnC+4stSBcZdPxidznqSNJSxs5fp+LMKLm05d1tfGOiPXwKiniuB05j1
         w9zoi8Z3GEfcC1xYCz/Rv+1CitPjsRyPLrSPQRF6ZMYdApRiTi0d+bPNwNIh39DOMtB6
         ZADqHTK2mnufkdc92c4M4WCNmZ0CnsE2MfNujxwFLinjWOvuqvUKN0D7iQFrYQuE/d5j
         gzIyB0PHVMoFw+BEwWQVRxVMmKB/zTQftHQVbOc+A6z5TslTTNziCkfFEUAJeNNmGp/2
         vHXKJUU423ba0fPg1GDhLlBWhcTyvnUNPXAgp/h0VEsBB/wjcEv5LoQHHCYyCrZLHtFq
         MBoQ==
X-Gm-Message-State: AOJu0YzjpXHFV93nxf/Ir5E5RMUI6OfsshMq7KjI+7/DJsOUpLMcQoEw
	W0HAKARDy5vmlsuDzEJw6nYybjqBpGkYCE5m3OBVx4/IsS4Xft8adKg2wgci0HFjDnw=
X-Gm-Gg: Acq92OGORZFCFL1yh2hyhiib+jD1MIBw3QQYtrtZtjsFCO7CLJGQ4hkWcy6jwtA8pWy
	iureS4yCY6A+KBG1XCSZaQEsgZbso7sP1pyuv5sebF0tHBugI4UBuvS7vgwwBHzNZqBvzwXX8rB
	lG3D/JOElQhk6eHSiUka3yYlcVli1o4kScQw1FoEi/SfhTnQgLq3DNcsRPOgycLx2BV3uuzrnxf
	WAHuhvCj8h3yHZH0etPja7YnSHB3HCV31SqH23hRUvsgMFs0IwaRl8KTBQWb6dvx8nQoJ5mFDzw
	Iq21Wf0myE+wZzTProQsZG+gZ2PMGyk1Gey1Efmxyh3SJorpXEwMVber9TWnf2Wv6DjPFctaOqz
	KYIylBh7WgzAOeDGaOC6kzQEE/FMjS8dzZqhxxAbIZr+tfYByADRqdoh1wzTS27nqF0jtCRT7ZG
	H1gXf3JTZP/MOcmA1011O/xck=
X-Received: by 2002:a05:7300:ac82:b0:2ed:e14:7f5f with SMTP id 5a478bee46e88-2f54b89a1a3mr12270718eec.35.1778524466234;
        Mon, 11 May 2026 11:34:26 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eb4b7sm15034774eec.2.2026.05.11.11.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 11:34:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 11:34:25 -0700
Message-Id: <DIG2AZW3OVI1.KUQA51BEP78M@nexthop.ai>
Cc: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Guenter
 Roeck" <groeck7@gmail.com>
Subject: Re: [PATCH RESEND v2 0/5] hwmon: (pmbus/adm1266) blackbox, FW rev,
 rtc_class, GPIO label
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Guenter Roeck" <linux@roeck-us.net>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>, "Alexandru Tachici"
 <alexandru.tachici@analog.com>
X-Mailer: aerc 0.21.0
References: <20260511-adm1266-v2-0-7a6d34f0de5d@nexthop.ai>
 <94cd8a1a-7b72-4c4b-a4ca-72cdf5ba73da@roeck-us.net>
In-Reply-To: <94cd8a1a-7b72-4c4b-a4ca-72cdf5ba73da@roeck-us.net>

On Mon May 11, 2026 at 7:10 AM PDT, Guenter Roeck wrote:
> On 5/11/26 00:51, Abdurrahman Hussain wrote:
>> this series fills in some gaps in the adm1266 driver and removes a
>> probe-time rtc seed that was clobbering valid device state.
>>=20
>
> And why the resend ?
>
> Guenter

Hi Guenter,

I was tinkering with my b4/git/smtp settings trying to avoid sending
over the b4 web endpoint. The `b4 send` went out the same web endpoint
relay again before I realized what happened. Hence the resend.=20

Apologies for the confusion.

Best regards,
Abdurrahman
