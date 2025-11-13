Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218832ED17C
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Nov 2025 20:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763065341; cv=none; b=KyhXondSzrdUv0bI5QAZB2xqFcg9RVfP58XNg9MZLqZuIDHpfdXvDorPKmMQA7dZG56THEDlp4ABaAZAcIi5KsZedbosc286Tzs0RMpm297Vc4fGbrpwwQdwMoHRH2y4Bqe84VE0PUVmFow1B3J99oukmff2fwLG1mAQR4WrBsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763065341; c=relaxed/simple;
	bh=LJNdvCQShnnDk3B46gOnj8yUHfwC8UWXG4Hr94ZtTLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzPrWm9A0cg8E73TnbQ1tkPyp9hLOZv6wDXO1b3Ub0LlA98QaNvAQswvKZz/BdMki1TrG+1qUDUg4fgNyhyT5IB187/TvOjR0eU/YBgVCqQWW77NoiLJ6dpUGYcXF9zhUyfKM3avrwk4xnNgV765IuUCXO1xfhPs9HAULSPv0bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ys0Bu/WF; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ys0Bu/WF"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b55517e74e3so1048042a12.2
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Nov 2025 12:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763065339; x=1763670139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJA/ILUWUCvl6zSBvsuzSDDNlvRFwKS2gcWUIyiF8R8=;
        b=Ys0Bu/WFYpOgyP6sRSpDi74fNoSg9gifXi5RL9yXdj7o+QML8xGOiyBYJDH66BRBHe
         emGMdo/qzv8L8azh4GQDa0v+3o4j726SA9riW/EZ2/kf1Ia2VU5kHhJmXm3dRlfIB2zO
         DhSQg1Zq7IdXEYLJBQldEatgk3T5FAtQtWAUqQFff6rvMRYJkRqrACbVT5zqHkODU7f3
         VbREc8c89gh3OQCyx6yzHL5kh1nDC7AFhRcfXK75RTRWh1y8a7yhucyXpEeb3qbWbwQ5
         LSVd2/yXidQ9o1QL3kx68yPp/KZgrGY0XZi3iQppNZjYZDN1/U0QWcajtVi7gF2kM+RD
         vsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763065339; x=1763670139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NJA/ILUWUCvl6zSBvsuzSDDNlvRFwKS2gcWUIyiF8R8=;
        b=PWETctI716eqo7MWdya8aTyDEyRc14s2d2kuzz/4JHlBP8RkhY535xn4jwGHU8+y+R
         5ljiPmitDBYHtc4q54dCThDAZTbgb/Ef2drUa344oQjOkf2UgT2o8xFkMyt35GVmBwBo
         obs5nh/91O3n8YUDUwysugTs5dHVtrRiKTSc2n0YagFgFvSHxbOWzFvG6IZbch+uUfqW
         UG0N155CI7rC9G8UQm+dH29d6Txjn4xuJAJ0Q+d4s/1MlQ+LuGdaZXiTeST2tVIQPItT
         f+DJtZQZrK3yo7C2/1RhTlYuMUg8CPYSu4DA2X36M92pprnxY6eF8+dQfuZKqmuDSH7x
         XAwA==
X-Gm-Message-State: AOJu0YxHaKXRY4AUF3NF3UAXybdfzfS/o1QvV9uLFdcx5Q8fDxT4Iqpb
	yxx9Po4llNKmx2pQMCoX++Uc7H4SRmBlDoUaIcpEPZ+sFIVGhIrcvkkU8eHekg==
X-Gm-Gg: ASbGnctcyHUSZSmw2LnyzI7sokCgvWKDiikj3tTLbzG5w9FhNHV/vOTxqJhWSbKOIqV
	5pJlfUe/sTeQlWvl1W8NzUh0PtvdKR4LlSYgpNrHWQ3+P5j+tDE3qSd8k3DbmtLSqFyjqqGQZiJ
	wLsugonW8bPHTCjXYrHoXonWFNveHPJtcoqnTD9zlDXoBhDItTWHAPVpSYokOw9C6dJCUFeXnd9
	uAJ9p9Qav3j89ga68WoA8sELY6isz0QCANbH9UWFBgY5tI+LkIeKM7/pWlq2n08Vr6Pyxh2CXJz
	+NYV8jwW4MeXPI9WU7nTfu5BdU54Mui149cli0pXRn1WxiHrxH+Cc80GPh0+bQkzferxFbbg13q
	zAonkU5zm7bSq7yf00IWvGvgJhbjjamjgHPDeHPjxAoUez3GNUIrBU2zgPccTjGFT4Q1QxwZTcp
	5DsJyNpxghu5uT
X-Google-Smtp-Source: AGHT+IFychci0+KG1rWwR7slK2G4vSE/GFTrE82NfE6VgqTvYBcIBd/2m7o8JbZMQmhiGUIEcNnNFA==
X-Received: by 2002:a05:7022:6091:b0:119:e569:f611 with SMTP id a92af1059eb24-11b40faf26emr348985c88.10.1763065339305;
        Thu, 13 Nov 2025 12:22:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49db7a753sm2159257eec.6.2025.11.13.12.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 12:22:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 13 Nov 2025 12:22:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Marius Zachmann <mail@mariuszachmann.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Replace magic values with constants
Message-ID: <38a91f84-25ae-41a6-aa31-b1d3c3897b40@roeck-us.net>
References: <20251113100024.11103-1-mail@mariuszachmann.de>
 <20251113100024.11103-3-mail@mariuszachmann.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113100024.11103-3-mail@mariuszachmann.de>

On Thu, Nov 13, 2025 at 11:00:24AM +0100, Marius Zachmann wrote:
> Replace two magic values in ccp_device with
> existing constants.
> 
> Signed-off-by: Marius Zachmann <mail@mariuszachmann.de>

Applied. Please watch out for the subject line in the future. It should
start with "hwmon: (corsair-cpro)".

Thanks,
Guenter
