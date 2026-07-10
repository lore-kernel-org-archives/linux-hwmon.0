Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036DF225775
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 05:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783662479; cv=pass; b=AkHI0II8XPnXZzrF1NR0aIMVZSppkRiy2m03FKUSqCuhsr5Ni0110bVztztViyUCDZ/fMo20UAFfZnAo3QBxlJGD/Z0GQBUWll1qy0H6E+kS7NUB68gjDjMyYDcoAZ6bqCKG2DsE4YGoQb0RfLCC2cq8gDInpKMd6LRvVJxt4vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783662479; c=relaxed/simple;
	bh=zbjyk4jVwksYQSY7DGOhN1TUUfiL/trx5uMITM3uQJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SqI3vsgFyaUxf/ZkWN7jyMrNIledIgeGGABGhh8jVyqIhcQgweJpmx6XRHI9eZQQH4c+ZHEryfM1K6KO9ii5rHeUxnaIEmVnYT8pfwryjNovuWYrOVpx9NMwDs2yW0hq3V6FGQ7vq0UxzsKhol2Fw/ilDgr6rGfkof2zz2NTouM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLfAtW/F; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLfAtW/F"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc73e322dbso5253885ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jul 2026 22:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783662477; cv=none;
        d=google.com; s=arc-20260327;
        b=g/tSquel8M6tfeUefch18ChaeXfkzNYBFzQ25lrqqhWpSTzSgDVbpnztd8ENzPzr0w
         ApKapDon9nLHkSBM5ftjKWe5YWxq2BAK6p8SX9ivB5kvXlg9h+OukH5rLV7QV6hL9nUY
         DtgiZDTfKqShV0P+yiN+LaPOFFwi4hjjPGBgOnwlMGRMy3DVjcHdc9i6K1kGEbSf/hq9
         shVDwKnSUCDjBzL77viZo+ukBycqJUwOc0P7TfA52H3ja/JV0keALZ4dDabnxf0jAuga
         nSs+xqP1MYZ4ZGwpZAKB3sPGLXTSgq+T5V9TlPW10UngR9yoHfHRCMoyJ8KpZRLe8LxQ
         KwpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zbjyk4jVwksYQSY7DGOhN1TUUfiL/trx5uMITM3uQJo=;
        fh=udylLJ8Hc3tAOfLezTwAX7DXAHjBUL2oTMeWgi4E86E=;
        b=GQspKYLOg04zSmq/HyXni5iE4wNORdbXwfj1TwhShy9Mk5bMtH3g5x6Pjt3qPmagLW
         pZNwiJ/eWhoj5YqzRMKou39gRNRTaIYGOTQ46vrpW9MxduAfPMQwGHQ7Ez4JlpEzBTfB
         l4E/U/kAKE6sordsyyUUYnnB18HuJH2W81IDYrokdLh/aNWUlFGAIN5HFHxtYG0FAtZY
         nI52pSOCxJEvlxHmZYIe5F8Tkx2zeFEvGASVEzkYYCnFm4PCfmg4pD59+RF1BS2oHP2B
         ES1Oz3h9k73yBwaJKH7efwTMInzaPEsp10PL83mvpdHoqnT3xI88kkdYv65ulVJER6cz
         heCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783662477; x=1784267277; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbjyk4jVwksYQSY7DGOhN1TUUfiL/trx5uMITM3uQJo=;
        b=ZLfAtW/F7CuEM3tfnVQ1sstS5bPpEj4E/8wDaWl8XHoN91+3uBa5kUGjvYM0FAu6is
         azTtolXGMZhGBaKBsVznv3fUk7ta8pP1HH0eIqFM3AxtLNMW4N0/E4WgpASg/u8VnL1x
         N1ApSh5QclT7VQR9WR4imfbZVbTvxdlwaI6+JdMqk6oZuqin6dilKZqtn9KFlVDmewR0
         rPR5K1pekh6XcUvchiZsHQsBZ30ECR/3h1iODvDZxOl63uHaciCqyIrgYqvE6w/Zu7sV
         caVHg5FM656MLcLXccQUMY6zb08ZOQNrquk4Paps+010JvlRTTTZXCmuRGeNhjiB23jn
         VhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783662477; x=1784267277;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zbjyk4jVwksYQSY7DGOhN1TUUfiL/trx5uMITM3uQJo=;
        b=O10y7TMQAYNBTXr2fzuWNQIwyzWR2fSBh5/69d3R1FAeoLCF2N5VD1gRNRRM0HRg9Z
         e0OdgxnplOqYf6EZdm1qdr7eyb3i5PbJfphPWu742/SdAWVjG7HHeNxTgVdeXzlloFqp
         nASjaH1ezn4sbWarG2BXsER+XDyEbRlLMXoyUMdZvXcYVCu+wy0sOo366SSvbnFM7A0e
         SjXEPVVc8PpzUgcCFwqSG9udnnN0f0lR6dG2ETYGzDIgYD9NQ2Ew42V+Vue/6ktzkiQW
         GFcSL+lAXC+g+5ACP8xpDOUjU+IlWSRSnqL9X8LlebtDDmmEilm4oWzYRK/IFy067FmD
         JjBA==
X-Forwarded-Encrypted: i=1; AHgh+Rqzjx6amqf5z8PputbkoCUGWKcCIYUHOjInwD0XNeyQPPxEC8C26EI9+ajY6x4qwig2CzEqEl1vkkaxuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt9zja2Z0rTi8f0Hm/IqLl4H5WHXk5aH1dnem6W2qyA8wKJivV
	5wpBXVhx7QLSW78xTgmqLLrlsPP+i4bYoS+4nn1cFO4xhYLLAGAjSL17zFW6rb3gUZktQtcocq5
	YhSYdwW6wtYz/hCaB83NOYIvIEZAFfXc=
X-Gm-Gg: AfdE7cnn+WtB+ilGEznuJ0edUAg/QMF8eOpJNAYZZyZqqTTyN8Y9IbNOnjpj0us3tgv
	UBOFXd/L7nn8uqEtJUjp1yIpMuS8MkgEvbXkM5Ck3LazQFFgtycYYmGaN6DWhIjtPvCTEWKVlGF
	uckkVTE6yqFZLSaKXNWEuNeQl7KtE1O6NJfH8pz2jX6OY7DiWtKVfqU2ywZa9yESaA/3VW3RVo6
	tWBzYU7UNusNRdCIhGcTp2IKE82K7wMYz7J0VSfWdu8cNLlaPQy+aw4Tum+4ETJGYJ0MihiVM2l
	dH7QbExT6gG0ieols5tiTsxdH7PBNg==
X-Received: by 2002:a17:902:d2c5:b0:2c8:1f56:9fc5 with SMTP id
 d9443c01a7336-2ccea489446mr105571415ad.35.1783662477134; Thu, 09 Jul 2026
 22:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709204037.1998433-1-eugene.shalygin@gmail.com>
 <20260709204037.1998433-2-eugene.shalygin@gmail.com> <ce6bca91-ca18-4764-a268-1429b41fb918@roeck-us.net>
In-Reply-To: <ce6bca91-ca18-4764-a268-1429b41fb918@roeck-us.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Fri, 10 Jul 2026 07:47:45 +0200
X-Gm-Features: AVVi8CdlKj6EhQEON-TLBomryVqYiblNbDnzIKadnOk8dwWcuI_3VjmFkBuyLa4
Message-ID: <CAB95QAQSevPFXHxJ0yGonjXee8-qG2KWUKW5YDT+C4Fuji33qQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: (asus-ec-sensors) add T_Sensor for ROG STRIX
 X870E-E GAMING WIFI
To: Guenter Roeck <linux@roeck-us.net>
Cc: Vishaal Saraiya <vishaal.saraiya@gmail.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

On Fri, 10 Jul 2026 at 06:58, Guenter Roeck <linux@roeck-us.net> wrote:
>
> > Enable T_Sensor for ROG STRIX X870E-E GAMING WIFI. Board specs list the
> > sensor, reading return -62, which is one of the blank values for
> > temperature sensors in the ASUS EC.
> >
>
> Just like Sashiko, I don't really understand this patch or, rather,
> its description. What is the point of adding a sensor which is expected
> to return -62 ?

The motherboard provides sockets where users can connect thermistors
(T_Sensor, Water_In, Water_Out). When the socket is empty, readings
the sensor value returns a special blank value, which is -40 for older
board generations (maybe BIOSes?) and -62 for the newer ones. It is a
good flag that the temperature sensor "exists" at the given EC
registry index. Hope this clarifies the motivations behind the commit.

I should have noted those values and properly return -ENODATA, but now
I'm not sure which board family uses which value. I will try to
salvage this information from my notes and the Libre Hardware Monitor
project (where I implemented blanks from the beginning and users fill
that bit of information when adding support for their motherboards),
but for now the driver returns those blank values as is when actual
sensor is not connected. If that fails I will likely test for both for
all the boards... Anyhow, this shortcomings will be addressed.

Cheers,
Eugene
