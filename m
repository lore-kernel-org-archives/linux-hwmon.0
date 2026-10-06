Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AC5370ADF
	for <linux-hwmon@vger.kernel.org>; Tue,  6 Oct 2026 11:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287334; cv=pass; b=brk/jls+WuNMFiqkTQueG6hWsCBkNw88UEsSh5NT4Y393oI6E0YbdxAiKq1qBLA2izxj9sReRzeIk838B7DYnnPSNBr8rb/QYxioD+y4RUERKW6O/BI2FiszxVBvUp9NeJDuuGTaIzU4/zinWrcFwkaZM8WdCT1bwz09aNgwIWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287334; c=relaxed/simple;
	bh=jYJ3IdQnPrGlZkney67DWpSuVjwOBnDlJr0yOA4BAXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j6NdOuqswBrFMfcKrVTLhM+rGpeT/Wb5oiixQpFPE0ah1gkKsVAhdHa0SDr0XGySKmT5JXJnv7AcGbB+oCayqPaWZjbF22iqBpeqZCz5Svw3RC0XohDdJX+BDJe0Lo1NjQITUwSn3ERtSEYI6Og6bz9MSk1ocDH6uede5sfQJ3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/S3AV4W; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/S3AV4W"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so3841835ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Oct 2026 04:48:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791287332; cv=none;
        d=google.com; s=arc-20260327;
        b=E6xYdJknUqYzdadsYxFERd/pa/Jv4LNz2F28ccNcNn46r8sX3gHBhQpy5S2ret9UHk
         vnE+l6CkrWg+aWETFj7NgOoBukPW8qBJcJHg0ZQCw5y18IpvyWlHRj3pLHpNxp6oP8V8
         EKARZgJlH36TFgdC07bdgYr8xTOVv0K0jzNLDRgFENDdTJA31Qi9RhHxMYFhEpsJUYnP
         /MM1VUTKfIIviX8FQx+kdSCyRP/GjeENT0RW7MwdnmxRXOjFDEsZpor2CGC7gws7I1PK
         v2JdHzRM4J7JR27vHCwBddw4BWCl22u8JET4X5MoPC34UY1D+fYNRtYOCAYH084k8H7f
         aWfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jYJ3IdQnPrGlZkney67DWpSuVjwOBnDlJr0yOA4BAXA=;
        fh=PTnsV/oVeNDz1N4/noxsj8dufCBc9g4BgPTE+UiVx+I=;
        b=cVjNtSrrgG7vv7NZPUkIFPz1TM/GtBj4+SnxO4hGI/QSr3nPGeVx+b3POISxpFRTiu
         8cz6Epxd6Ie4vW+Xp/N71VK1t3Ckv0DymhrvqeaFeQDAX5mEvRNxXhy9FNnXl93BUlyg
         lgFqGNvbBiNs4iWUK/ibun/I70Q7PTGXNirsFRvtAwlAFm86O7h9wybL6xAmBY5LVif6
         pJreY85WHK7KO/rFc7jGjrGGEdRgLxCKHNRNjNcd4w+H84nDm0JN9f7ih1ZJkIkhjKP5
         NPG5Hso34350X39BLNLbsU/y2mlvdk33ouequfr9DFwuGtuPBd91Xau5qmL0Os4q0UGv
         r2jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791287332; x=1791892132; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jYJ3IdQnPrGlZkney67DWpSuVjwOBnDlJr0yOA4BAXA=;
        b=S/S3AV4Wb/6L+uQ1KRumjH7w+tNlWIs3J7jc0gd7dz2RltFveeFx8NA0NC2mY5+7iC
         zOPdBQc/1qMLLZe0ER1yWSC9jCOT6xVztDvYRhjZmiadCkMRBZks6v3psAxctwDy2CUD
         oI8bWhLLSerOQ4BZEV+BNP53sYCUKpFru1OWrboVFzY4DQaTX5KGLmGCltZ2YaiE49zo
         KEkU1sODQh7Sr9QxWRaeEuKiUkrx2wA9VmLljpc+ujVKgxfYMPy6AIsQ3D8V2qIb823H
         DqlahuOJu+GhhrCR+LG5zd0/YBXCUC/bKHoOXoFcqRCCqn/M1B0nChNRT9BvsR81o7qd
         ux5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791287332; x=1791892132;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jYJ3IdQnPrGlZkney67DWpSuVjwOBnDlJr0yOA4BAXA=;
        b=CBXtsR+jc/yBBbMGp/zGbduAEG1lXF9BNp4rOaa7bpf8g95/RcmYyAf5fRPl4Y/PXK
         Lt5CbNuNBT1637cdi6gHy1noz5ADPRCTP7xkFzqCfxiMgZ4HQ3sXGuEp9eMnxU5ATUdE
         fAF0D8sv6LESXUTvx8j8AYuExt7BZNY/P2ntQdIIj1AbE9HKvgD5OGarXS101Az41XWE
         bKcqDsgFljeF5QgzAJrZbZQr+fybnB3sRENemyNiJe5XhNz+MZ9TwDsBr2rdxV729nAY
         zUz1p12yj1vrb+GbuduLZxu8OE9DNnh3Vd/ImEnPUP4PkuLLHcWOOgJO6MSA+6Yj9Vuv
         5tvw==
X-Forwarded-Encrypted: i=1; AKwUvBzKi3f3vLRkc/8Kib2Dei/4U56AUTwWR7xWbpvG+0R3Zo90IL870UThOEdoxNPYryUijab9MhocLAarwg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ93jB1pvVveyaTJCTdrn9XMWleLsmBtLmnnx2g4j90eWBce7Bb
	2DtkFIFOEYjnejbxV+DErQffkY/euC/Fmpqz5mcvzQvY5X4zGIAntH1daRWaAhTzunIE+LVSpgr
	EWvC22t349eYjoAuE5mITDToY+6dcDEM=
X-Gm-Gg: AYBFou3Ot37vTP3MIGKoJW7s2CYyF3BJqTc6qt2Oo1qfAkpEUm8EPZ0+slbqKfayujP
	Yxb9kOarKnOvGrBrEtpedtwcsUNclhN/siaqv3T/PNvKpvU9tgNLzk2pSQVN4y8XwoCE1tnw/Yh
	8uAjf4M3qJ7pxmzRGqRhC349LOhWRd9zFbajxAivMrr5gs4TXtq18cJVL5Rj0WxN2Uj37zBb/Xo
	9wZDbEvtS+B7svhuvwUWtVrzfY8R86+ZE5LGwz40liIm0S0J3XFujZlSGWlC+Z6lB6t76WLYoL8
	TEhTTXKxz+Ml3pOtOmZMiKuFtpVO/BRPiT5wJZdqGQK9RG+a556W2bHJH7twoPALzZMFYX4Dj2+
	tWq9pBl32sMUPpr8hkM8=
X-Received: by 2002:a17:903:244e:b0:2dd:ad74:ac7f with SMTP id
 d9443c01a7336-2e5dcda375bmr8786655ad.26.1791287332318; Tue, 06 Oct 2026
 04:48:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004-asus-ec-x570e-cpu-opt-v1-1-d9ea371c30d5@gmail.com>
In-Reply-To: <20261004-asus-ec-x570e-cpu-opt-v1-1-d9ea371c30d5@gmail.com>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Tue, 6 Oct 2026 13:48:40 +0200
X-Gm-Features: AclHuK8vZ3ZZc1eQpcjpnegkwDCbrJBuk7gokOoEYOfEz1Xn_OmcqrH8tPcCuB8
Message-ID: <CAB95QASjtm0sUOSjr70+SNi2qGsCSMJKFh3D1intNKdmK5UHcw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add CPU_Opt fan for ROG STRIX
 X570-E GAMING
To: mdlayher@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Matt,

On Sun, 4 Oct 2026 at 16:26, Matt Layher via B4 Relay
<devnull+mdlayher.gmail.com@kernel.org> wrote:
>
> From: Matt Layher <mdlayher@gmail.com>
>
> Enable the CPU_Opt fan sensor for ROG STRIX X570-E GAMING.

Can we have a laconic description for this more or less trivial change, please?

Cheers,
Eugene
