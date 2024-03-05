Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FFA535BE
	for <linux-hwmon@vger.kernel.org>; Tue,  5 Mar 2024 10:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709633690; cv=none; b=PHj9OkN9w3PzHiLYkR7+yRJyy81pzW+bxSPAj2tD7L71lIwJv3BbiT916v7gy4EsntMDCJc7XzBHB2wsWhHHDwxo4l6+277WZdRoTtG6TPVQ41Yx5plU0pxznnJZ2lWPO5xw/6t/imz/rIY1cHh9NNF5UEQZBmuAA9jVT/rd9n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709633690; c=relaxed/simple;
	bh=XZSjqZ3JSf47Da2QFL1XzdQoirjzawDffre2zOpsvBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JpqIjijzaK31/QGOoY63ZsR/NyTj1GLrL9R/1RLdD5UiTkES/jbz/1lOWWpaNJvDKHSyCDTidJ2hJlOev6S38IxnjmDog+hSJR0gwzI4I+VdfrqB31x+IEqaPCYvFPTlIZEcpr+wa30ZhWRw+NcJRxi/9GwTLWBFLgXyUdSgSSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=fTAIHpkT; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="fTAIHpkT"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-299e4b352cdso3629687a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 05 Mar 2024 02:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1709633687; x=1710238487; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XZSjqZ3JSf47Da2QFL1XzdQoirjzawDffre2zOpsvBg=;
        b=fTAIHpkTMNkKAVH5L4rPqTS426w5kZwPDjPltYNItv24Spop5YYM76Lpt8gzah3PzG
         AyhT2eVp+xi5ZyEtBgl5IvLY8Dvc3dM8fzshD513YoDRWUpG2OR9twhqXdPCFcgG7o7E
         Lfu174/V1Uv7fcB8zKBJ1jDiQDCpm/495yh7n9CV/1GllBb+MnMCsR2qYsz4ByV8ctPy
         wrfi+rX5QAotfzGdJJxJzcau02SLbn4cksiYDUFcAbNZpFaj5Xfoup0YfchVCne+Cmbx
         CbwR7z6flu5vboaTd3Xlpe+0FJ/JxKXohLEM9h6ChcqL9QyV4ChostU48mFoqOIszUl+
         3iZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709633687; x=1710238487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZSjqZ3JSf47Da2QFL1XzdQoirjzawDffre2zOpsvBg=;
        b=kuAGVzpCgzAABvCOBjwptDnPwRLPtemled5w8ocIdbHEPYHw8VIaj+iwkLqWwyeHDN
         y1/cKNYZiT+NNCtPQAI7lWOPEMHqQ4R7oiIO+dc3uOSlKDTjk+qVnVrM8QFdZzVB2nWk
         0fUEQCwQwd6mzB488AEJKsjixxairrlZUtAHuBkjscxuGRE3w5ojHK66iF6lF9S1h0iD
         QV1jtJfh4EP3l1Jd9qDdOJfoy4Vu0/bXdq/ckkOm8wSnzIglOs42u4yYESsFY253+j3E
         rG/04my9Y5St/4M+b+MtCMQ4Z4vXWfHVS50OSij7bkyw3Jr/rvqjO72UQEi7gP+7AwpP
         HJ8w==
X-Forwarded-Encrypted: i=1; AJvYcCUgoX0YmYm3Ly8fVDbEC8+LsxhyGffIbuTGn9+zZ6qpNsAOFez3zt0i3HGQAZ0LNP+C3DMGHayFHVt5MH6LUFtE9R4ich9hUg/fiCM=
X-Gm-Message-State: AOJu0Yw6lLONufpndXuQ8RP/yVKHDFcGrvcSr4BzWq5wARRIwrjKpvpi
	17B4Nhvvza+HWcCZirJp6JuiNAOjXfL7ydI6gu0tEMVOUX9oV8s3N0QlHZccdKgFzDkm6BEOBsF
	y+cUossPg1eY0DNzoKW6Z7pQG/VlR8QSjTdfxPw==
X-Google-Smtp-Source: AGHT+IHS33vobaUrrJ8bJjIllSw7958PJUMYVf4Uq2M4zLgrKScGVOnJ8NONP1gs3gkiBAzcHEueHL7hQJMA+7Bth4s=
X-Received: by 2002:a17:90a:7143:b0:29a:842b:d8b3 with SMTP id
 g3-20020a17090a714300b0029a842bd8b3mr8853381pjs.7.1709633687461; Tue, 05 Mar
 2024 02:14:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240304164446.4153915-1-naresh.solanki@9elements.com> <3383421b-bda2-48c5-bc49-d3d9f2ecfe25@roeck-us.net>
In-Reply-To: <3383421b-bda2-48c5-bc49-d3d9f2ecfe25@roeck-us.net>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Tue, 5 Mar 2024 15:44:36 +0530
Message-ID: <CABqG17jJibwOcRbgutVh1-QDVpcYPBbUSm2pC=jw7EiRAMyt4g@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (pmbus/mp2975) Fix IRQ masking
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, mazziesaccount@gmail.com, 
	Patrick Rudolph <patrick.rudolph@9elements.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter

On Mon, 4 Mar 2024 at 22:30, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 3/4/24 08:44, Naresh Solanki wrote:
> > From: Patrick Rudolph <patrick.rudolph@9elements.com>
> >
> > The MP2971/MP2973 use a custom 16bit register format for
> > SMBALERT_MASK which doesn't follow the PMBUS specification.
> >
> > Map the PMBUS defined bits used by the common code onto the custom
> > format used by MPS and since the SMBALERT_MASK is currently never read
> > by common code only implement the mapping for write transactions.
> >
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > ---
>
> What will it take for people to start providing change logs ?
> Why is that do difficult, and why do people seem to assume that
> I have the time to look up old e-mail chains ?
>
> I'll have to write some boilerplate reply. Until I get to do that,
> I'll simply ignore patches without change logs (which I will do
> once I have the boilerplate as well, only then it will look nicer).
Yes I understand change log is very important. I missed adding that.
Will resend the patch with change logs.

Regards,
Naresh.
>
> Guenter
>
