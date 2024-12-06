Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602D71DE8AB
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Dec 2024 09:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478361; cv=none; b=khj0/axrqCb6sMGZprS5v+pYDcRuov9vaoHnVjh02QwIsZZhMHI6/VCqKKZmMrxa7/29wlG7KaTfxN2XszFgE4/5dsiRyhhvCQsFjPyatRmPMzNXUSlg2hlyTSiUrNsORkXMF0c/tmvZ2XCTUoN2tj1pPCpVsKzaKjR9g9WnRv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478361; c=relaxed/simple;
	bh=EXpaOzMIJO2JzlWxcLt/F19POk1LLWLqxGnBEUnF9O4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NUTgK+Pxd1i/7ZVPdVlSByN7QfMkUr8Bgej4rRwDIJy782FDgKd+dG7yWsNLLWnm+bEjQdZxRxZVR/xpFhZLxyGzmG66WaZF3nxZ7GnhKh3hFGb1JSxt/OixTn0R0cEeQzxoTgwLwn1J5tGPl1/kfQbfggl8eQnz8XbIMs09BdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=x8QeLDF8; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="x8QeLDF8"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so213861f8f.0
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Dec 2024 01:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733478357; x=1734083157; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RAgxhRkt3GIK9XtEmGgQLQ0NoGPO7kAzWDCkDDiu6YY=;
        b=x8QeLDF8mGvJKzsdwWB5CVfPjm+2K4kPgRirKvHtUjy7NgyV8eaNysBbix6rmjaJS2
         Wht49uAypXJ4KqiHCwySkl3Y+8ZJUxsmRRkXX8QVpKUbOY0M+MzYIH0z4F1FqBhb6kFj
         qzBk5R2VH1TNmOhbGd8G7UAGC1ws7bX7WdL6m6OCgz3WSosx8Mpt+rYuuOQVIhIibqAY
         f4KRUACoJBStrC3dg6PWcwmvo9zRNCjGso3AlcXECm+nGlaQTket03F8mWf26FPtBXpq
         HCEz4dDqTTxSNDuMEPmenWbTTGL0uQBqmjTgA69JoUqH08xIEKFvo6zmFlLfhtY9EUrM
         EuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478357; x=1734083157;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAgxhRkt3GIK9XtEmGgQLQ0NoGPO7kAzWDCkDDiu6YY=;
        b=sE2rHtsK8gzzu80g0jYtiiyVjLeYZXm+juHmZKnxeisl/9+ZZEaPcIylJZtDnNaiau
         OY4mFTCvDiapCQoZUOxG3RO9sN50FiLYKY/5AfVseunCv9pkD77JFyWmh68B+5brB1Cm
         wZpSWIWVNDOIb6US/XoOoRl+p39SWkLUavMHBUoBITcFYzDxEH7OJK536Rjpqwgm0hd/
         sF9MXp5ImUi6LcvtzUGEWPCi8R3FIOU1DLEv+LQSYxmHpaP/Krs2Sag1CKFEWtRmgMtO
         5wzYncXtYIrOBRCuJ7nKSpjp4lfZkU3IIR6UEuY0gEFZQ7m7T/7EJw984kNKwVybZohG
         6TnQ==
X-Gm-Message-State: AOJu0YxguIHz0rUhRrSjae/Q7DjRUK5ZxGmt7XkmMPoJjQms9fMrlKiF
	6fIhFfUBx4ZNJyEMWUvRz+f1xH1BhkQABp5kY9k4Tl7GtFQFfXgXjJ1elUvl1bs=
X-Gm-Gg: ASbGncsuPvaGH2Q9d5ZZcwMqmE9eRTq6WCq6pr4FZlnAfLaVNF0XryVcQcNuHYGBYKM
	7JJxHfdox/9yr4uowSfThf6w5cCwjRdAFvn1/wtxgc3gzZnVZI8EaqXWQ2d7eWW0hWcZegZYO1Y
	Y+EZ36LEHJy60KL//otmrflc/ZTKMFhWSlqTZE+rMmPiPN/INBJ5gKVn68Ip+dJbN+IHfry7Csn
	+wKM8osG8SP8khfR+pqbC78AxLoP1te+DL/xCZD23GmtiQx
X-Google-Smtp-Source: AGHT+IFpWnz6cknA/FLLo/mpoGRgYLat+BZu8YGcPpp2rwce+nNI4fye2NV2ENM+Li0+R/b45TW8VA==
X-Received: by 2002:a5d:64ab:0:b0:385:e10a:4d97 with SMTP id ffacd0b85a97d-3862a914a05mr1834992f8f.21.1733478356654;
        Fri, 06 Dec 2024 01:45:56 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:3ba0:2e9:e83e:9420])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3863002d29fsm182533f8f.111.2024.12.06.01.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:45:56 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [bug report] hwmon: (pmbus/tps25990) Add initial support
In-Reply-To: <b2b550ae-a2b0-41f8-a0ce-9dafd1714f8c@stanley.mountain> (Dan
	Carpenter's message of "Fri, 6 Dec 2024 12:37:40 +0300")
References: <b2b550ae-a2b0-41f8-a0ce-9dafd1714f8c@stanley.mountain>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 06 Dec 2024 10:45:55 +0100
Message-ID: <1jplm5jga4.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 06 Dec 2024 at 12:37, Dan Carpenter <dan.carpenter@linaro.org> wrote:

> Hello Jerome Brunet,
>
> Commit 6fbd1e5d9876 ("hwmon: (pmbus/tps25990) Add initial support")
> from Dec 2, 2024 (linux-next), leads to the following Smatch static
> checker warning:
>
> 	drivers/hwmon/pmbus/tps25990.c:134 tps25990_read_word_data()
> 	warn: ignoring unreachable code.
>
> drivers/hwmon/pmbus/tps25990.c
>     127         case PMBUS_VIRT_READ_IIN_AVG:
>     128                 ret = pmbus_read_word_data(client, page, phase,
>     129                                            TPS25990_READ_IIN_AVG);
>     130                 break;
>     131 
>     132         case PMBUS_VIRT_READ_IIN_MAX:
>     133                 return TPS25990_READ_IIN_PEAK;
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> --> 134                 ret = pmbus_read_word_data(client, page, phase,
>     135                                            TPS25990_READ_IIN_PEAK);
>
> Is this supposed to be stubbed out?

Thanks for the report Dan, silly mistake indeed.
This has already been taken care of by Guenter.

>
>     136                 break;
>     137 
>     138         case PMBUS_VIRT_READ_TEMP_AVG:
>     139                 ret = pmbus_read_word_data(client, page, phase,
>     140                                            TPS25990_READ_TEMP_AVG);
>
> regards,
> dan carpenter

-- 
Jerome
