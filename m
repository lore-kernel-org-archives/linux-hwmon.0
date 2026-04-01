Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1C23DD526
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 17:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775063096; cv=pass; b=eTpBbgJDo3wZM0WAoj2nt0Yi/0+D6d9enoUg8qVo9Gv8l/upVVuH34b8wP43pDpvNywj5ApuMmG7jv2C5OCApNPi6qBOsHUpQWPSm2SrSDYYl05XK60YHLOx04IfEALdGzLGl5SkJLUYrtMnjw0Yxj8KPwaYZsXfHF7Xojqg1dY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775063096; c=relaxed/simple;
	bh=PZ8V9jV6v75t7iNcL72UhPieQ7P2rRHBXob8QF4vrYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jKFXRx+Vngtt73MlfpgXLAY00sZLKO0q/CvPeSyZvpCx440v0EFAm+ZfUk2aI1BC7loi+vcOd9bhqiEYHuv7A4XqxDhz3Q9BSe/1jzohOJBWFXtNVnWZj7+4inOSwShSfILpEGc5XNRQz/fqFLIMhYtAGj6bKPCGrNT6EYDExpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ot8lb7tz; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ot8lb7tz"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ad21f437eeso7887995ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Apr 2026 10:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775063094; cv=none;
        d=google.com; s=arc-20240605;
        b=fChQ6YViGeHahtXUrHI9zW/csEfff1aFhZECNWJXZ+3gMYM+RhJJIzzUTMCFgV2vpG
         saqdNK/BfLzxtlqCzjobmGdAFnEq1CzGiYYUOFYIITx++EDqf1kLCKaNFr2ChOHpI/Kb
         JQAMSRiqJdlphUu0t1exMwNHnoTDnYR8ZscsAziLvIURZTa/g/JlMHDMMoYrGYSG8Hzl
         FMVpJiesy355BJoAGmcZY/hWDX+r9u0IuxJNtPhAASyGvyP69Cu/6ErgXk4KoGwewetD
         mNDHHHLLBFd5g3vik625C7UrF4UE/5nuUFsQK3I+bJO0Y0dqrZiQVEDPZufgJ8tFeQzD
         evcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PZ8V9jV6v75t7iNcL72UhPieQ7P2rRHBXob8QF4vrYc=;
        fh=LZVnrThb5rQXrEEMtr6CkpSGnOyuvZK3AKIB5BNJT6U=;
        b=Nygf86NuaQJ4yKio73yrOQCodd6JcBuhQt8lM4lNt1YIZBZLUIJfVJ3D/l8wr93/zg
         nMhkhDx0+CcFdPDZ6t0LwBIhjbwJGN5eGmJEZ8GXJDBVaduavtLi9EhP24PgeBsugXbY
         raAANX0wAZ06MB63WIsF0C4somk2J0NbQ0vO242jNAU+9DUxLQ7+Sz5moFVERmEEW4k4
         GP7iOW6WcTEt9sNl40VVnHTEp01viigPzLBLMiY+EdlMcXUzdBdU/eg25gHb49+10eDb
         QbuOLqpyhTNM3ffMySeZSZaJhME6yjoxh4zlrP5mpjAx4u0jXWHYSvS5YvzHTl3jK74c
         RyNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775063094; x=1775667894; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PZ8V9jV6v75t7iNcL72UhPieQ7P2rRHBXob8QF4vrYc=;
        b=ot8lb7tzIkW5mRxCFl6Zc+X28Np+zFYMNpcOrCXusfeHt5gk9JBI8QKqzQ91e/WrNa
         pG9nX6yjg5rJKAC7I70nAMsl+DkWG1ZKb+k06WtfIM/tTEs8IQocFZ2PixBFqG39aHgh
         BTXC1Uv7T7EnTQKFmYfOQSstwcSAcEV7QkFqFpkOjPCK0avs2DDkr8d3lgEwXR9XtKhO
         DuXTIGlWTYpikipOXaX5X1pbguU1pZZdxnBrLhzXqCPjphKI99sCUAIE8jSs9TA7Usco
         Dy00kk3vOf6VdtEu0MqOAw4WV6OPQud4tBQuEFEJw21zO3YxJqR29VpSb1TtMhUAGOCP
         pVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775063094; x=1775667894;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZ8V9jV6v75t7iNcL72UhPieQ7P2rRHBXob8QF4vrYc=;
        b=bl82geDlc157EFFw94Ldd1nC4W06P1WxBW5foiHhI9iJlEQPJlJFMWD6hZ4dHDQye5
         PM56XMQGxmlkpYLfvTqTqvizeUeTVXBkVduK30cw4/whH7Q8dXazx0J5Zg4gpNjxhi2H
         Y5dri3mtcNOnJHa82MgvML0Dmf1QbhTIBoN0hvIOpipdGuydURNGHwmGdT1GF7WjhYsg
         fq0i9S6EKz2F6o1Q7+LyAYsZzvL+wkd8e99cwYDxa8OaS6MWsW7fcM9DAj9cVL5IC9ov
         aKuP8/2ihxzuPcMbNmckCLje2aIr1zM3HKolB+qhCa1rJnossmJ2/7Kz0Am9egv3kkvq
         dWEw==
X-Forwarded-Encrypted: i=1; AJvYcCUt/C4v5oz7MyHlQYeNP1xACqAU6zTYIN61hOg4lflLXTRrJE1u1PuQlsI7MZszltqJ4ZcADOLM4R+6Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwptoNSYIDGvpBJHdb5AfqCHEPxRhjPMViBocwx3aheDAJE6uYn
	X5d38BFqYVlJTvi9JVCxtrwCbruXCc6/JUNSqpeggWeSkD6gF98GyQEdMkrpW7dgl/ImT4ZKYrC
	vD/chSa6hsZaazFw80x8yqLInsi4dGjKzSg==
X-Gm-Gg: ATEYQzz3nhHl53nP0vgO07PneonBTHpMrT5qnMptfcE/rHTwlG0oJhdM9kriEnn7/9r
	IrWM2QFi9RQXp0AmbnvcoP5KtS0RJli7Pd2wzc2KK6ccrjadG429EepV8pTTTLP81bwojntWF3k
	JO/6bxi7RhsrQFtXwOrDDMgux8s+6zhhFoq5y0FzYq2lvLN0FKvx/xXBFlYjbnNDQ5rd0KATJJn
	PiBiNKek6IDgyzdwwuhrs2uvk6CLTNgNsd6glG/ulnLQ9U6jyBN0nVYwmvy/7DfjGlii9WwLAAw
	DmT0zNwweGLzoklnV4Qrw5f4pHQkBBSg1FMQRP7lCXdF1/4SxFg=
X-Received: by 2002:a17:903:1a67:b0:2ae:5a38:96bb with SMTP id
 d9443c01a7336-2b25ee79daemr78604345ad.2.1775063094456; Wed, 01 Apr 2026
 10:04:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331215414.368785-1-bugfood-ml@fatooh.org>
 <6f1e43e0-14c0-40d7-ba43-95ece77d7176@roeck-us.net> <CAB95QAS2-K4VADCveRfNCziYiBMJb-P7McQ3EFVznHqHBDx_MQ@mail.gmail.com>
 <38703f7c-c082-40fb-8ca8-f70e8b8c7d25@roeck-us.net>
In-Reply-To: <38703f7c-c082-40fb-8ca8-f70e8b8c7d25@roeck-us.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Wed, 1 Apr 2026 19:04:43 +0200
X-Gm-Features: AQROBzBcVaVChR1kokRjUy9VvvElSP3fCXCL7GY8ILgJSq8reiP_lbwlQKtDQtw
Message-ID: <CAB95QASwrwk1N7Qaosw7Eu19VNoH46ZAxQbbziNP+P79G8zv7A@mail.gmail.com>
Subject: Re: [PATCH v4] hwmon: (asus-ec-sensors) fix T_Sensor for PRIME
 X670E-PRO WIFI
To: Guenter Roeck <linux@roeck-us.net>
Cc: Corey Hickey <bugfood-ml@fatooh.org>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Apr 2026 at 16:45, Guenter Roeck <linux@roeck-us.net> wrote:
> Yes, I'll do that.

Thanks!

Eugene
