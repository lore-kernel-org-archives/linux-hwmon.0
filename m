Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF781AAE0F
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Sep 2024 14:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727189059; cv=none; b=sFxwiS3I6yEzZsuTNIyQA1V9Q4LEQrJpbQZXb4/yVKpQXKse7xn51CY6dhAlX9sO1b+4hxL4By67zitc3FafjDsYIQ8lQ7wqvvu6w9rG+bS5q3TRj8xTn3NufSoQLfoeuYF+TRb6YHIjJpSGtnO2n049KCsW5OTVmVxcaTkti4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727189059; c=relaxed/simple;
	bh=OnGN/XN+ee5MdZgun573fNASG088NLEb1co14YIjXWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JB4WVkMycd5G3gAOf6xCMSRQ1eZGlneCKPrt1/q7v10dzIq237V5QO3CW+nXH0a1wODBFjhxPMsni9T+GmEAXSPn6rIrtg5xsbHXSVQzpKYZnvv05a2QariWXwOr5N5tqOmAUELufffSd2enpP3knwP3zOLATxFcbnWfAahtlwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=A34i9DgE; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="A34i9DgE"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2d8815ef6d2so4408149a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Sep 2024 07:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1727189057; x=1727793857; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OnGN/XN+ee5MdZgun573fNASG088NLEb1co14YIjXWE=;
        b=A34i9DgEADcWy+RGyIPUOW03d5lQe80fHYVsgi/CEOXwnN13aUFEMStHSazg8GM+LB
         d4LHM0jGu5P1Ibdydlq7sVImD59xcrWbrVfF+9Q8KqEaykoi/P4v95B0/MhQcuW6PF3A
         Faj3Vrn6xZG6UpijIdp0n4KbgJ0IrCgs9ytJFrZo8cE98r//izJDvwbpx4pAVuq8qECT
         FOoI2Wx8HQA+dw7czi42QwvONAWWHR+jl7P4HNZz1Yei+5e4LK34cqpWG94szjP33vd2
         RnV/J63Q4BcYGMiadtpQ5eGOAp9yhmyUWUmHDcEErU9fyl0J8odyo7IiQzEm/xnpt60K
         SkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727189057; x=1727793857;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OnGN/XN+ee5MdZgun573fNASG088NLEb1co14YIjXWE=;
        b=MYtHSdoKVpJZgkabfuZHyoKbrNhkzDC5oKkcDuFQ5zOJUh1tc6icSpV7H10YL1mu+P
         MfrXsoBcqa6DErCjJp1EWoQ6TUoDUi2qGYKsV8pU/SO5C8emuj9G0f2R/9WarDvBIG8r
         4dkwxVXmDf5SXWuPV74uIoUhn2FyL9yOuxnzOnx2HQXyRCR3CR+/aBFGsfJNxpic7Ehf
         38NKutTUQM/GK+CzjrdM+sftAhvjAa2e1keJhxiQBIPEuToprHoYnzE0UgLrLREvNXiN
         tuXbJJnmBVEjGlZ0TshjwLduH5+vy6u2ZJLLPbowsT4ZKxUoF1XSMwStb5MeyTqg6ie/
         V/dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE1xG8ZiMBdV5Qw1JL2mCugh6s45KvVRlpPQUzG9eJ/wTbJHdhwKzLEjBZic4Dx4vcnpOji9GY2TOc9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk2eV/atV3g2cBgKXxvArbKtiGYDx6NnvG0Rco0SRzDW5jzdML
	EzhaOURPBSs00ZAPIR9FYq47I+YQZZmP2fF/i79W6RDiSklA+D4xpjhEKButCQIUl8HKzikRyTb
	IuUrzXqRNx+m2X5/aAAkF8kcLj2d7r7+JQytuuXQMPaX3hlTKIII=
X-Google-Smtp-Source: AGHT+IEY5FaohvDwhChVCfAb8IAInDakknFlo9kWlRYgAaj5nylT5EknAUxa83Yq83BTkwNcoKuexQZsbJhiVwlewVs=
X-Received: by 2002:a17:90a:ca96:b0:2cb:e429:f525 with SMTP id
 98e67ed59e1d1-2dd7f756480mr20035620a91.33.1727189056764; Tue, 24 Sep 2024
 07:44:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628115451.4169902-1-naresh.solanki@9elements.com>
 <349543e5-21b2-4725-9b33-1fcb4ae124f6@roeck-us.net> <CABqG17hpqFG-PeyENXnGn9k7V2goBP+k6BtSURoMM7DgXtxWmA@mail.gmail.com>
 <0aaed899-9001-4355-bcca-17855576a928@roeck-us.net>
In-Reply-To: <0aaed899-9001-4355-bcca-17855576a928@roeck-us.net>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Tue, 24 Sep 2024 20:14:06 +0530
Message-ID: <CABqG17h0+HWSCF0PRVBaj37WYYsz17+n1MD1Uiuscqy_dvU41g@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (max6639) : Add DT support
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

On Tue, 24 Sept 2024 at 19:42, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 9/24/24 02:29, Naresh Solanki wrote:
> > Hi Guenter,
> >
> > Sorry for the late reply,
> >
> > On Fri, 28 Jun 2024 at 20:30, Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On 6/28/24 04:54, Naresh Solanki wrote:
> >>> Remove platform data & add devicetree support.
> >>>
> >>
> >> Unless I am missing something, this doesn't just add devicetree support,
> >> it actually _mandates_ devicetree support. There are no defaults.
> >> That is not acceptable.
> > I agree with you. It is best to have some defaults & then overwrite
> > based on DT properties.
> > But in that case we would have to assume that all fans are enabled
> > irrespective of their hardware connections in the schematics(example
> > fan_enable).
> >
> > I'm not sure if that is fine. But if you feel that is alright then
> > I'll rewrite the driver to assume
> > everything is enabled with default values.
>
> That would still be a functional change, or am I missing something ?
> It would overwrite any configuration written by a BIOS/ROMMON.
With that, driver would take the current chip configuration as default &
just configure specific config specified in DT(if any) & continue with
initialization?
This can keep into account the Chip defaults, BIOS written configuration
& even DT.
Is this what you mean ?
If yes then I'll align the driver accordingly.
Please let me know if I understood your intent correctly & any other
thoughts on this.

Regards,
Naresh

>
> Guenter
>
