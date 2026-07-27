Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29856233946
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 05:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785129037; cv=pass; b=qn3tHgwUxFNCqMUqDMKyq1SRvgXDjtJjkIKlP8ThO7O5q8IKMozluEs3d6Ue8bex7yz5Qg6YnFD7rkG8qdlCtZ6P8tL5bEJv1A2/GP0UlF3HTRnVAUBWwXw1yqr57V7HJhoh/IHQEbzuXD6I6wVYI0fGa1BZ7Kbe7BFxtGlHs5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785129037; c=relaxed/simple;
	bh=F9u/zbnemk1aAhVaCDytyIi+xMq+94ZFyWfvI3P9AOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvtB+ND3keY58yML6FkCtq7hLXeziiSamhdtPKGXa0hdU6XRqp+5oMQdZOVwhS8vl21VeF7RdJIeNp1r/RCmaNW0sr3pbzdWcFdRN1ZicpXWhfD2Si474pH9xUfIJGK0bG9liiWoSr71pmed02YnMkW0oYQRHyW4KCgi1Vuk6Xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SGECUXEG; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGECUXEG"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c1c52d920b8so285819566b.2
        for <linux-hwmon@vger.kernel.org>; Sun, 26 Jul 2026 22:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785129034; cv=none;
        d=google.com; s=arc-20260327;
        b=aFUgQz0OdlaLPF6QuzyuMqTHJdT2I+CMRRNWOoDP6Nr+aTHYP5ASqCCxSUTutePDf7
         St9/QDI1Yb0BdzvhpWFhnp1m2qtU+k9M2btEAdHoca+Ps28eIdijupvYqPJlFQvKQ8IV
         oPEr9ps0Tll3flcmsGvBeMJG+qWHaQS15waG5JjfWSrU8yzZI8G56G6VmV/JeiiTIrgQ
         5qvu/FFFGzj2VLsoyUvg11D22G7BGz4Gh+ULm+lDgdlvZ+mERVYSKOdGGYYQp9B+F3xZ
         Q4MnvaBB3CBYS1+8thXZEwNa3mYG2qVtnt0yQ3CgVxUzSOI/XDI/RvGW7IUMawsA0cFE
         AYQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F9u/zbnemk1aAhVaCDytyIi+xMq+94ZFyWfvI3P9AOE=;
        fh=0hdvEPJRino8wRvGrrw1gATkOs6ExpSix2L2F38xNVA=;
        b=ChPBwl0t9f3aUhFu9eSRwZ95kYuDB3rpVunEVf7blLx2acMJ4skcYB++WPHZPvbvHl
         21F/Wn/zqSCuQ7REri86yvA9CG6pYE57ZZLCvHptgMZES51Cjakyxq8I2703wvtOQuZ9
         ucdxCdRYSuOLKpD/1gxQyzWib1bfczaYLhNVqtKvf6s20uKFKGM/6V1b5zJct+O2T9bi
         AZOrRXMbUSatjMte7ug57XJj0j4ylpRaSf9lnPsq8h0bl8V/YdlUv71w667wqpR6/w2q
         k7HQN3lJ3CAFMhVWQ1jB47ZBciVV7EX3isGgcvLCdkEGA0CWVmI0N4HPQmcxCnNaKJCZ
         /JZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785129034; x=1785733834; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F9u/zbnemk1aAhVaCDytyIi+xMq+94ZFyWfvI3P9AOE=;
        b=SGECUXEGsm4EleLmIPg07gkDlZgmnJ62UsCKgsOcgSbeiaRrZme48uqKSgFGEjWi1E
         uZT1CxxHwTseNLc00c21rApmoU8CqqCBJSm9r8v6xFsmONfviockjwaB+Nd7kWwQHAbl
         cyCjW2DqG3u/qt0jo7I4k4Kf51ofeq14UmRWGQM3FlE3MPJDxw83tqu+PeRm6nra6Dpt
         7ZEfr9IBVCP1/IhbRptuy4S+JEjeq7SB7jgalAiepjGzlcZh3u9r9/zyVq164HHwep2x
         sYzrJSHpWOA+da5ZxkkhcvxSHv4a5N1LwmuLqgIQFPREy2qYDyqtU9LpUp2YPp27xYR1
         8hrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785129034; x=1785733834;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F9u/zbnemk1aAhVaCDytyIi+xMq+94ZFyWfvI3P9AOE=;
        b=kZMKXrkt5ILJzLmRfxRkJzOrebHwWmpgj9IVGqiXiPd3bOV1sLU64BV3/e5Dnnzbh0
         oIAqSrbqWKU3uplxTvgKejaxWiBzGrXG9gNdfd4kBYV1U9MAQXcAhV0/M4ywOGWWpMy5
         BAJs9NlIKLJkx7prp32gfISlTK1R7YYp4OSQkok46VJATGezICOTCkIvewbJ0HpNSJa1
         Npl5aIvMnn/kgQ0BUEIN7U3KHyqhQNWSkX6aKRuFvvEO5K7ooxlIH1VuiPZhUluYbLdj
         W2mnoWctItWgR1HxvAhI1ZRYeuSXYKRJHgcBadGX3iQiQm3ZTzv18Uu2Ob+XV9Rje/QC
         3TcQ==
X-Gm-Message-State: AOJu0YxzwL17KRiyJtxb3HTvBMRiiBthG0wrWGCMoOi/rPsj8wT6+YWh
	SbQXToXcJJ1jS3T1AKs79VmtWHEF8bceJOJgvJWW57Ks3KTO5MROPXVpLTqtaXWld3i3CFipEzc
	jxzWyssgmJVEj8HmB41a5k6ipmWf7kaXhgi8N
X-Gm-Gg: AR+sD11kk3qvZ4sfrEgTYc/2V4LHggEczfKytaqO3JAvQxHhG0G+n2Z8V5y13O5eHsY
	CSd1h1cG4uLE6AdrCh9ZC21ZLFrzgLkDl9zuxpbytuhW1qXQpBdKWb9ISYui7r3rLJbb6UpGpth
	dEJWzTkvKZlS6QlAkSZJeBtTU//8T3KKW05W7xB2ItR2TlfqzWxCsI50ZYjM9Z0w4jrI0PR3/in
	V6JVtOh1ter+cI/rh5yI8k8tpVIzZL9wDQEDn/E25mQqeCUE/bIEptxPvkF0Xl7uwc0xeFKud9u
	3e6+Rw4OLTa22uuQ+mc=
X-Received: by 2002:a17:907:1c08:b0:c15:bea2:d209 with SMTP id
 a640c23a62f3a-c1f1ea074cemr282302466b.4.1785129034195; Sun, 26 Jul 2026
 22:10:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
 <20260727-adt7470_thermalzone-v3-6-21424d550c3d@gmail.com> <20260727034502.94A5D1F000E9@smtp.kernel.org>
In-Reply-To: <20260727034502.94A5D1F000E9@smtp.kernel.org>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 02:10:22 -0300
X-Gm-Features: AUfX_myLEiBJLLwKOv1xZ7uhmd3Jn_mkcnvtI6X82WndotEiSgOFdU_bkNoDXQE
Message-ID: <CAJq09z71XqApV8hWQ1bniEgNZ9nJfJwJ7p-CRu1D_MZwOOYiJA@mail.gmail.com>
Subject: Re: [hwmon PATCH v3 6/6] hwmon: (adt7470) Use cached PWM frequency value
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> By using this modified index to update data->pwm_freq, does the driver end
> up caching 11Hz or 15Hz (indexes 0 and 1) instead of the requested high
> frequency?

Yes. I'll fix it.

Regards,

Luiz
