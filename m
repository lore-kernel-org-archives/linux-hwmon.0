Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEB93164BA
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 06:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780901065; cv=pass; b=k/p8U+4ZtgqPi6DpJhNQuksnhE9z+xr3WyE6pt7lcueNB7wjlknls55YQl7GZc4argawjfoO11Ey0miCtgr5GORXA6ckJBKd27I+NyHGGNj4iA9z69i+g1HYPcEkY0poSqQrXAW65k4TTbLOZkAHe5z++rae+HxXDNqXs0BFCgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780901065; c=relaxed/simple;
	bh=Oq8FO0fC1H6ZktnwW7vcFXmDVxZ7+6PflK8V+/qjneg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u6sEawWsJSO0/K9CrQ6cP5zDqsQxuszMQklSfQ0OvB9hdQv+NfoHPTSezQc/DPmDi/4rRGEAzbFHahK08B9UZFJSj10syc+XCmiNOKLG7Q+pv6bD3sUfLH6cElP/7PgrNt6UIeupXHqFCVvxWyUz/xdQBa4uaa8R1aj002Fy3j4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q2nUhZKI; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q2nUhZKI"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c379e8ffso25846535ad.3
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 23:44:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780901064; cv=none;
        d=google.com; s=arc-20240605;
        b=UvnpCixDNxKw/21g0t1gxiGGlSmO7wPi1BViOp/2kmeaQg09I24sDqnGZRBzQWGIm5
         Mjy2+EBG4btjHeQ1jybBxt0S18RU4otWI4qjST4trwlIVrUwO7R8ajb4MRT3cgVUdqEu
         1K9BIKwcS3zMY6RSGbjJgo3A3Yq7yfvcYE7GB5EPolgdyFXbWL1SYgH05Mc+/n1x//xN
         NKEt9l+M3XAnwM5N0GziE802UryGzIyvfhgIeP6zdXkgBnu2cmCQnM1H8PqxltpNGcGj
         ig9QAvZiADP3i6gO2UDa3uDRWaMoJGK/Oc5A3sTLxCvVkAvTkZkUV7mAS+eEhPL8Y/Tj
         HuPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vrWdtJmKVKxWjz14Kp6oiB9mB0ijBAp6gqBi0mv7EVI=;
        fh=0hdvEPJRino8wRvGrrw1gATkOs6ExpSix2L2F38xNVA=;
        b=bdjbIruvxpwnU+o4wq93RypQsPapjz7fznTn9JD8QmKtlYa5vN/XHfbAWJNPUVDOp+
         wyaS4wf146AIgM+hFeL64Uar3Cij3UEwLUvj4h++47+8WFvQW/bf0Ay8EQdiR275yLMf
         xhwsUsLB0G+Jdn+xD/En1jMQllaDj25hEafgSlE10TSdw7qHXYEqeJeHw3JlhW1ZlIls
         kfvJ9VySt06F9bo5q3rQp8cLN1W9BidzDUmeXfFviPSGKZpAQdqUVBmhGQq+uItxWG9D
         qy9AHdmNdpuajIdnsljJgnx2kiWHAXqVQrhlxE2ckuoPvSVrGKAqgJyaCjZwF8NBNI5F
         d9vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780901064; x=1781505864; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vrWdtJmKVKxWjz14Kp6oiB9mB0ijBAp6gqBi0mv7EVI=;
        b=q2nUhZKIhhnpE4zfoTBJKZGZPWmGLP9vLCkjlpE+6jpTLLRhTfCXbT+xhi/1Pq1s+z
         7KXnlTSi8K/CFlVvBpaiHk9lLxeIRwSk8EZROKlCgx1+GKxUis7lciwt45DlRKrzHW53
         vwILAY7P1FqHnjLrpw3wbj28gvm/mNkErqtruBLXmeucfAqtc8eE4NFcZtv3TbDr5H9d
         /6G3zBa0YybHVyR/OSxvYWJe0pvUHobhk5tHMkZVU2/cRX6+XrbFx216QlkoAA6AIK6f
         3z+aHbf2CwwP7Uk200CGUTOTlmrSknPrV1ODCPfUhdPZDsLCuerNrfkbEklEAypZ8TAC
         dWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901064; x=1781505864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrWdtJmKVKxWjz14Kp6oiB9mB0ijBAp6gqBi0mv7EVI=;
        b=DTCJUjQCvOwYjRgQrkatsQ3S7pDoq8awZj31TaIeVz5eViJYEEQONw+15SQZqQUB1u
         rmf764vChRo3BPKs0gy/6hjdUVbmmrg7LVDdI7F0ZgoBN8sgNgAIHlZdPjMFmk1Q73hx
         2e7WmB4T0l7y4n1oFCzlDO6cEcR0bEgi3BdSaUht6aWTLqP+nSIKJGmI/wubWshpSswR
         HYXV8uztNvDSXu6Gazrgfhqx2ZxxEOat2FcFfqQZtiPHKFz2tBj8iq9Giinvu+5D5rsY
         awJOx0aKRTbCQw/4eIn/tdDuMtkzdTYv3Ykonbjcxh41kmHKvOndN7MBJlDWfZ9+8LRD
         BEcw==
X-Gm-Message-State: AOJu0YwtVHtlQDHqo18qNFnauymBHiIw3fH+PAs+sja0YEt6LGtcuYtt
	jF+potkU7BwfMr8BWLZO2vrCqclXRaRZ4uYSMdmA6NxplovEj6DmYV7dLvxcOpxuoPO9su4EZTq
	DKFTDJ3CbaKjvuWSYUvfw6V25ETNQ3oo6ggIa305peA==
X-Gm-Gg: Acq92OGeWw+F7M1YjiRpHE/m6vU9INCHL88uymz+Yq0Nh9/5a5aR/KG9Q/G39BYPlj3
	WYugaEcqQvdtstji8/kfusb/+bo3v6u7sjLDHaSe6wRc/zXIqqrWR2IWRuGfU+50rgdO6IjGzYl
	MB4bCZ7k52Icmjx9cbWqaSRCgFdwOE5HFxfVYEWaY0biYZgtReiUi3JSY77qQjaCIju8TK67aX4
	CyZnnoZpBwJN0qJ8QluWOW8MmsIpHSnz3RJIC5W6v1mzz4nTThVxNhArnQx7Pj7+mbyomfYPHLI
	N72iaJ/5HB8nSNEbZDOZiYIrPl0XSsEi0l5sxlqBfkP0YaZUlIE=
X-Received: by 2002:a17:903:291:b0:2bf:2243:d4ee with SMTP id
 d9443c01a7336-2c1e7d33343mr168409945ad.18.1780901063874; Sun, 07 Jun 2026
 23:44:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608060855.40469-1-eugene.shalygin@gmail.com> <20260608062358.E48AE1F00893@smtp.kernel.org>
In-Reply-To: <20260608062358.E48AE1F00893@smtp.kernel.org>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Mon, 8 Jun 2026 08:44:12 +0200
X-Gm-Features: AVVi8CdD04Ff3IyQb5uLfCPfTYUX69BwSpcrrr3tt1T8_M9letvBKDGdwtOVO3I
Message-ID: <CAB95QASFZjTAqZqaThXL9hB-JRqNUDvdifpJbYxV6iT0X2x89w@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add ROG MAXIMUS Z790 EXTREME
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jun 2026 at 08:23, <sashiko-bot@kernel.org> wrote:

> Looking at asus_ec_block_read(), the inner loop iterates over all requested
> registers but only skips past banks, omitting a check for future banks:
>
> drivers/hwmon/asus-ec-sensors.c:asus_ec_block_read() {
> ...
>         for (ireg = 0; ireg < ec->nr_registers; ireg++) {
>             reg_bank = register_bank(ec->registers[ireg]);
>             if (reg_bank < bank) {
>                 continue;
>             }
>             ec_read(register_index(ec->registers[ireg]),
> ...
>
There are only two known banks at the moment, bank 0 and bank 1. The
condition can be replaced with '!=', of course.

Cheers,
Eugene
