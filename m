Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034847;
	b=PdQKzar5M2LFgddHg150jmqf+serkBGi+6DlQtJp+9/HF+Cq1hAZ+Xq2HIyXw9giBc02
	 ZbFm0II9LbjzPiPawqabgP2f/0HOXaxf+oYL0qGPMtFpw/vXudttfrdsK6x904bdUGYVQ
	 LXURS3iQO0wqJuKwUOaZZd2YFEzgatJQoag4yGP41PZ6oOHvnC76E1gd58MHCESoyU0BB
	 4YcISKDQESjvnzMH7fEwHDetyD53MuP52mZC7rwiHklpy1VsAHQIuMITs/UKzbJpNcXb+
	 Nm+rmb+njXMoGqlTCiYn6KyaqX1t9hMeYK0aoB5fUE/JDPIpJp3Ro57+WxNpx7LAV2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=/gUAXmz3MujJTDtK8q7SzJkjmM40vdO98nfZeg2M5Hg=;
	b=wUaeFGiJZak0lUS2/H/h5iDeBmytPedJw68c8XSgNOtjgTUvZHufHnEB6qtWb+gFu8Qn
	 ZdypNNRfC5+mzhbDZr85M4tLewVzs8sVUdZxjIxJYLeZO6Daw0hUXV+vym2YVqZCteCR4
	 Acp7ABl8PgD/PcJeM2Xj/Xx4pLmtL355xFvUvQG+1571ML9dEhkqox09JlS38UI6hAuaa
	 9++16567n9eBkF+HyGb84wpYOB2Sl9dkESmEitFPEhUXiBa3fBp7EAu3+OVyYatAIZN3C
	 IVJvgRZxV6vBAhCzsEUdcpqDRINryHIxu09fi4r+MXB8x2grVWSMRzrm+gsQC14WNLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pNYeGYUw;
	arc=none smtp.remote-ip=209.85.208.199
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E97E606A332
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 20:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E97E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pNYeGYUw
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-3ad907ca4b3so7884271fa.0
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 12:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795034845; x=1795639645; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gUAXmz3MujJTDtK8q7SzJkjmM40vdO98nfZeg2M5Hg=;
        b=pNYeGYUwF45U8smY895omjr0W6lquykgDJ+WRCL3po3SunuWckFuvYmxEnmjw5VQlG
         YAVVOUSvinr/8RVf3w8W1OaDm3TXTrlFYNgWOOWFmA4cmTXrxDjf11PlXSY3N8HWiuhw
         ArGm0escCvvBYP+qegRQdNqmriy+GxOdQ6P6UCH5o0Pa4sVeMcfkD0IbT+nOZObSuzVh
         fBtOzOh7YdNquNUcUOJqKmczio+2LoZIf2t1bwMw5LOqGG7hxyctiHfKFjYu7abKhk/F
         NRg0XxK2cMbbj8zqtq2GQWjaCixyeJdFARe8193hfzDNHRO456V1fJLfXQn3OzrOW540
         PPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034845; x=1795639645;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/gUAXmz3MujJTDtK8q7SzJkjmM40vdO98nfZeg2M5Hg=;
        b=eVeCLYGlflX63a7BaHwZdfCnjZ6sDMm6JKR2ZYtR2FwT3At00/RrhuBWDu6NBWWOK4
         RvQEF8srf8pcstMUv/SfnCNf+ICvSMrjx6YttmGmOxmhxzYY5mBPH9XCMem2gjxsCQQ0
         t1TWzwwew6whdqDBE3uvXxdo9+iFivzBbhSFa2WquoC0wqb6p4HfiDMhWoHDGbI9NzBH
         pGZLWlQApeD5jCb3rPPjZf010HObLuqkl+Ghj/1AvpJgSkz4EV/aSwJnrTqJzriTYOrf
         lAtPQ7wQW367PiEs/idl2c4AoGXclYYaUKph5DS9Sw/bdsY//Oz8rCsHxJ0oX9CCi3xQ
         LqLw==
X-Forwarded-Encrypted: i=1; AL+hErGevm59+7nC9RIJwKG+e6fCa4N7cXyF7UgpccnFDTPpUa2nlmXCBVKtumOTLfQ/TOmINduvJN7Ekv5Ogg==@vger.kernel.org
X-Gm-Message-State: APuU4Z92Myod7C9xU5P16kq1eBCx/OCi551RIL/YPi5CbpNuXpaD0XK3
	Y8Tbao1RwytqdenlLxqVjKwDF/EhmbFNr/jZfWzDRGGMMjey7DNK6omxWYteKFEz5SK3tsCOVt5
	OIzt48C8vKQ==
X-Received: from ljvj19-n1.prod.google.com ([2002:a05:651c:43d3:10b0:3ab:3660:4afa])
 (user=dbalint job=prod-delivery.src-stubby-dispatcher) by 2002:a05:651c:1a0f:b0:3ac:a2b0:ac56
 with SMTP id 38308e7fff4ca-3ae6730a895mr13584131fa.29.1795034844920; Wed, 18
 Nov 2026 12:47:24 -0800 (PST)
Date: Wed, 18 Nov 2026 20:45:32 +0000
In-Reply-To: <20261107010356.39d9eddf@jic23-hlaptop>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106193129.43493-1-dbalint@google.com> <20261107010356.39d9eddf@jic23-hlaptop>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118204532.257423-1-dbalint@google.com>
Subject: Re: [PATCH v1 0/3] Introduce cros_ec power monitoring
From: Daniel Balint <dbalint@google.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Daniel Balint <dbalint@google.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, Lee Jones <lee@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 7 Nov 2026 01:03:56 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> Hi Daniel
> 
> I'm not necessarily against this but when adding monitoring components
> to IIO the usual question is why not hwmon?  What features are not
> well supported by that framework?
> 
> Note historically I suspect we accepted one or two drives into IIO that
> would have fitted better there so precedence isn't a strong argument.
> 
> Convention for these somewhat borderline case is +CC hmwon maintainer
> and list as well as IIO with that explanation in the cover letter.
> That avoids any last minute surprises!

Hi Jonathan,

Thanks for taking a look!
The main reason for choosing IIO over hwmon is that for On-Device Power
Monitoring, userspace needs an atomic, untorn snapshot across all rails
(up to 64) over the same integration window, triggered on demand from
userspace and read out in a single buffer read rather than repeated
per-channel sysfs reads.

Reflecting that requirement, EC_PWRMON_LATCH on the EC is a global,
stateful command: a single latch simultaneously snapshots all onboard
power accumulators and resets their accumulation window on the EC, so
individual channels cannot be latched independently. As far as I know,
hwmon only exposes independent per-channel sysfs attributes with no
multi-channel buffer or on-demand trigger ABI, whereas IIO's triggered
buffer interface is well suited for this kind of pattern.

CC'ing hwmon maintainer and list to keep me honest.

If there is no objection to adding the driver to IIO, I will clean up the
custom energy_value attribute and replace it with the standard IIO
triggered buffer interface in v2, along with addressing other review
comments and including the above explanation in the v2 cover letter.

Thanks,
Daniel
