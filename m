Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C30C2063F2
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Feb 2025 11:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583773; cv=none; b=C7jHSStxC+QQf0HtTwqppgrb6KlLZjtU5gUCumhxtmSBHvIsQJUbctBNlEOHScfjmnJen3KHyh8I+/F6r/IcAQfi6Hy/ZF/WPTK4q38cc/PeiTVixSWaxofS7fiY15GlX0mw7zsL3hE4TzWctEOPJJgZ6Y0tnyOG6xNWiC4pnLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583773; c=relaxed/simple;
	bh=5VO8qxHdPv1GlCfSqdK9sL6Lqc78mt2FtDInjR+r4xE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=STzXzAenSMqWqXFDKuP5idcz+MOiZuBQbfNNuTl2gpL4LN1sJZDCi0bjLFKkAZYnlFvFNpoKeruaIQThdNcM2V3KvLUTYAdzkHlnY7wKRjLUATne/SWulc1yNz5a52TQiavq79DxdhxkkJmSkTk0Ig/toGNBcJCnUjKTRTY4wFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UY++Gbq5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UY++Gbq5"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43637977fa4so5644255e9.3
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Feb 2025 03:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738583770; x=1739188570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hf+nXVuq0n7+9Hzbsc1pHZN283D6/tls331wlf2T5UA=;
        b=UY++Gbq5oALjic2kiOL6Y6hx3NYz7TLaTEuDiFgSUfyOd/d5KoeixoJEi0gmy8Bpbd
         RAc4vqJkhwL+BIrCT1teZYSX0kEof3cFT61U1ZL9GDqTE3x8qfK5+g33EddyXkzCmIgI
         QakZntsvRsbN8TyFRl2O43OKnHuPTskB/5702h5bZzjupoHlZmIKHY0YBljxaGrWmyzi
         povy+oQIk3MeQthGJj91UNlkbLdn8blPqaJL8EPoJPCgqA6SpNkV1k6WZQF8oiuKqxIk
         DHDge6l9jKS6mn+ZFPQgW2O5oQl2tzP5BGeAHVj138Sv3onnk/MA9UL7qVu5ghlT73K8
         KM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583770; x=1739188570;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hf+nXVuq0n7+9Hzbsc1pHZN283D6/tls331wlf2T5UA=;
        b=oXKmlxM5wXvMGwVEAwkliePb8iIXw3z047urJTBLL8jbrno9eCuH6aQfPBe8FDlXCD
         pY+8HzgxtJd98PS0Mhi1kqqrr9ckhFpiUBHrGOlownZ4jjDj3m7QEXR41n0uEACyDfOJ
         w4muOMoB36sRM2I6q2KMJYskNNwCD+0vLR/Oxtw5NB0VgiNphQ1ayfAU4hzUEH9XDd/U
         SWEvsRVSoN7fWnZRWaZZAMEFVfHLOQXynLi+ZlwQ+SusWhL1osEaxRvYVim5qYrL+pw6
         0/2/DzNRNZ+9ZP5d9mPGUAGe9/4sLEZgdPZjyT0ZGTEFF+9UKnI1pDsCz+lHr3+ShRLA
         qoqA==
X-Gm-Message-State: AOJu0YxWQ7tzn447ZOFksdZKMV3KvlwC4nsVCZqAyRaUv7ImJaxAR7uK
	uBbbUb2Zqxq6A8pZIt1SFpGVYqE6t/igQpzFaLMbVpdEPx87Z4TTEFsvxtc8Ed1UX/KV2Eh8tWj
	7
X-Gm-Gg: ASbGncvq2GwgXddsKPkpw2nvv36reEcebv4Niez/OW37m4/EJIkuJTiuVHxvGc1OYh8
	+DUkBsCQlAoz7S/A5alk+3tlTEwleNmhaMNBW2X5NiTLUNQaCe4tDalEmS14j9qB2h4aUDgEvAW
	xR5CH62M+kBOlotVeeKFmaKoV9RbZvk4eFf5KMovBipC8TS0C025bDqFvMdClzWv4RqwS2iJEec
	fPj5QzT8M+9tcXWEw3621uG0VnIb95qy0piBMsaz6njkhck+VSYw5zDpCy8hw5A/c+7dAtblOqX
	7x4RIZynG4pN1LOUp6xjL6Cfs01dbZU=
X-Google-Smtp-Source: AGHT+IFQbSU80i6YQYi6YzPYyBsllYWbDkIcbgELZu/FC2dJYOz3ZShx5Senfvr4yJ63Nm+XoGt8PA==
X-Received: by 2002:a05:600c:1994:b0:434:f5f8:22cd with SMTP id 5b1f17b1804b1-438dc331eb2mr74266625e9.0.1738583769775;
        Mon, 03 Feb 2025 03:56:09 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438d7558ba2sm166790545e9.0.2025.02.03.03.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:56:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, netdev@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Huisong Li <lihuisong@huawei.com>
Cc: oss-drivers@corigine.com, matt@ranostay.sg, mchehab@kernel.org, 
 irusskikh@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
 louis.peens@corigine.com, hkallweit1@gmail.com, linux@armlinux.org.uk, 
 kabel@kernel.org, alexandre.belloni@bootlin.com, krzk@kernel.org, 
 zhanjie9@hisilicon.com, zhenglifeng1@huawei.com, liuyonglong@huawei.com
In-Reply-To: <20250124022635.16647-9-lihuisong@huawei.com>
References: <20250124022635.16647-1-lihuisong@huawei.com>
 <20250124022635.16647-9-lihuisong@huawei.com>
Subject: Re: (subset) [PATCH v1 8/9] w1: w1_therm: w1: Use
 HWMON_CHANNEL_INFO macro to simplify code
Message-Id: <173858376808.132674.4568544450122043067.b4-ty@linaro.org>
Date: Mon, 03 Feb 2025 12:56:08 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 24 Jan 2025 10:26:34 +0800, Huisong Li wrote:
> Use HWMON_CHANNEL_INFO macro to simplify code.
> 
> 

Applied, thanks!

[8/9] w1: w1_therm: w1: Use HWMON_CHANNEL_INFO macro to simplify code
      https://git.kernel.org/krzk/linux-w1/c/33c145297840dddf0dc23d5822159c26aba920d3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

