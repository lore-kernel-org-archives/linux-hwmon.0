Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409423128B8
	for <linux-hwmon@vger.kernel.org>; Sat, 28 Mar 2026 14:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774709559; cv=pass; b=FST/j7w+oUeTXnqz/YOGhvQyLFF5MOtpwGZ6P3k/rS0aGZq30X3sKCFKOYN0F/RDhYRUxYv5z8Aehp53/qUjv/ou1IKvTeQhZ6Mk7a00o8Zw13G6YJkCRea3z55iXleFvUdK/WYG7NtRhYzACItxWmz6oMzUnwQVWY1yEI2yK28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774709559; c=relaxed/simple;
	bh=h+Lh6WueSKM0IITlt4i8GIxkLk0GhJhWIdZQb8oo1tI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MY5tf1pJCY7LZ6Sx8eNi2RauDivO+hTP+3Qh8ZO4tgXWCoVA/+5DeJXApaHr3rdmGexFZdRU654CF1hfZkKHTkbpmxM+5NSaQZIpoJ0LYNPGCa/R26NEBJjrPQp5UUFlnIbYJ/oIQuF5B31Bk5putkAd2XmbDQgBwyUu7e3YVlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebYs9By8; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebYs9By8"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b87970468so2810355f8f.3
        for <linux-hwmon@vger.kernel.org>; Sat, 28 Mar 2026 07:52:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774709557; cv=none;
        d=google.com; s=arc-20240605;
        b=Tfc7LqiOMqCKsNsgvI9vQacciw0sXmrfIVlfnbClJ8W0G5+ej7EIoBPgMDTyt0QGbE
         TxZel07hlqzvIGM0md+YLK0i274rkadjPse66o5SuXzxMQ/UtRcJedTgqbPNAbB6Wl/4
         lM4AOlcScTUdYD5ajPHyQY0XiNUqoAHQvN9H6LRGncMWb9BHwkK3Ctg6fJHn0uSazOtP
         RlrkABLqcnhQjvJlqH3siYOWDiViuYDTwiuZEkGeNVxtShYi3zTrsvKRPxjZVxierwSC
         PQt7L0TAr3CGueZoxMIThEZ181hdNlvajpdKvxjZ4Lv+uSvhlQpxs3owEzUXCxTbab9n
         xcyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h+Lh6WueSKM0IITlt4i8GIxkLk0GhJhWIdZQb8oo1tI=;
        fh=FYBF8/h+ZTnD/DivYZSowrv+uZE6T8bkwWZd1IwUPGM=;
        b=AaD6soFOqXu+lVS1req9WFbXkzvzombZMTkV7pSix6dQcuafbV2frImfelxAy0wZFh
         srRdClWpacL91d47XY0LahmUD/uh1NI55sBA79RtcoHHxIApUXgojiIa0UfqtaI5xj1i
         2wdOGyNHoCYRFA2ckgkEvXr1N7SdGJ974EJW1bG+QAWIN8+kGFldp5xp+xOhEV2PoBNg
         /KSohy3RCHqMSmnqwus/Ymnknxz+IFHSLWY9bvaKWepCTjhGq4Yn49qLZ2PaGJBqUt9h
         G1wuoqYn97IgW3lVFG9pWKoEaE/8umgQJxYLNdvOaBCgHFjD8HrNCn2sZxgFr2n5joge
         zWYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774709557; x=1775314357; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+Lh6WueSKM0IITlt4i8GIxkLk0GhJhWIdZQb8oo1tI=;
        b=ebYs9By8qlNqFQa4BJ/AzCznZd/Gq311U3cVqZQpqj0KnUWy+5qdlOcBUoNTVyQi3l
         NZ3UXivrnRia59ERE3b7XTNquRO8PUp6SOGUdR02eZ0FN0XdmwOPQksyEuuuN5zNwfOt
         wRLL/O1LDzl7PGhXiwK69j9cDhahJy7/Fv6CCxQi3PuvNur9Rd8oOsdPddzOR64wszps
         4WURZkiqZnaNdfb1eK/b3hXabIefdb/bhXXZwyVD0U0whA4q6yKFjahV59xQ49LkHTsl
         FbOeA32uKnJ9/Ukwrz6fU9aLWy6AS8HFgkccMGcVjCvIhaaPECKW/leDLcBje2PBkUPv
         tq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774709557; x=1775314357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h+Lh6WueSKM0IITlt4i8GIxkLk0GhJhWIdZQb8oo1tI=;
        b=ozUF1inWpDmqU/KGsJ73qdrXHj0Okyac0QW0M2W/bzVt0BnX2eqpK3hjwXOTKjJE1X
         e87Q32RpMN/y8o+5Yv9FZ/3Q5q/YwNkDyFmBz0o2vhnxREzeQpfuMlHIbwoQPFTYtSoT
         L6BWFWTCMnQAhaO03AbTLTzwAc+Rc0/nlZIFMz71xxMTrn1kJ89fpXXTeGULNKcjuqB4
         V9voPYxly31WxhA287U2MyuasoH+rVhhMV7vo1LAf4OB7FQu5c7tNun09KtNuQYKZROZ
         MYwzHpW4Vv5Rs082vGap86RccApulKnNQCGy+XE0r+BaUyEM6Kct/5KhS9oMJi93m/uf
         uf/w==
X-Forwarded-Encrypted: i=1; AJvYcCVJiCh+UL6AJbMznf/8K9gKVlxDh41mseyA/6ToDANvZ96n6lUmlfpG5GVj3HvDjNVPMShh3EzWlHOLjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNR7HkDxif9/hnQViFtd0LLfF+0MsE8Q09lxNZpEaG3AP5JVkk
	WwbeEgUxjSZMdiHJfmIm2gmBcmbxz0+bXrldrOk7wahiwkDxsz/tuAzG1FHfH9JTtKXTF32Hzja
	CZ2eo07dnVn/Zhy4xL8Takjaus/wk4xRjZVwpHJ54pw==
X-Gm-Gg: ATEYQzy77UQLIUeDFeu5UYxqT+3+i6Rng5gbxDa+vDZc9xRXPt1k/QAzAdnuKLX8juN
	xhY26XVn/8kTStuZI3Gx9uy16W3bStXaKbAbuGtg+8vSA/U2kZLrSAZiWgzPVQMTB8mwEgExVyW
	i87hYTVK2PiZ+0maobmgCZPM5/7lgyuMO/Y9zjR1TBahHjOpDFUMhaI+nf2QKjs0dIXY/TyPLZO
	9umVyMhfq1E4673qn30UorET+Uifv0P6AjG269diBmHcaICcBX64B/bVee2HcZbZhiYDBkvvyLK
	QoI2L14=
X-Received: by 2002:a05:6512:3b99:b0:5a2:a3c0:ac4c with SMTP id
 2adb3069b0e04-5a2ab7fa962mr2497612e87.14.1774709030321; Sat, 28 Mar 2026
 07:43:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327221602.18832-1-sergiomelas@gmail.com> <7c8dcadb-7e9f-47b3-8bb7-80a0e8412837@roeck-us.net>
In-Reply-To: <7c8dcadb-7e9f-47b3-8bb7-80a0e8412837@roeck-us.net>
From: Sergio Melas <sergiomelas@gmail.com>
Date: Sat, 28 Mar 2026 15:43:38 +0100
X-Gm-Features: AQROBzCS59HD-IUx2o4yrkwWUHwcuObTHwAdDmP79uV_3I8VXwq71DVtnK1u1kk
Message-ID: <CAP8e=s+MDArxzmk2CQ_bbKwj9H6CLDZe_4jxG7wOn2YFxmO4EQ@mail.gmail.com>
Subject: Re: [PATCH v11] hwmon: (yogafan) Add support for Lenovo Yoga/Legion
 fan monitoring
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 28, 2026 at 12:30=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> Sashiko is happy, and I don't find anything to complain about anymore
> either, so...
>
> Applied.
>
> Thanks,
> Guenter

Hi Guenter,

That is great news! Thank you very much for your patience and for the
detailed reviews through all these iterations. It was a great learning
experience.
After 30 years of using Linux, seeing my own driver accepted into the mainl=
ine
kernel is truly a dream come true.

Best regards,
Sergio
