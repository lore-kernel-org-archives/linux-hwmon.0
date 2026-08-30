Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594A213C908
	for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 00:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788048344; cv=none; b=TW8MFCiXJLWF+10ZZyHedxbU/3LoxgO7DoXjvpplugsWL6a3nUVT4hBlMQxA0qdpgYUy56ckT8Y5ZRwIzM0+lvKHLuNtlY4eSHVHNot1rlbewSeIBaYCr4I1eakrXtTDOwR8sqGWl/m4ja8CPV2GbU+c51cO5TNKlnKmi3TNXmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788048344; c=relaxed/simple;
	bh=5OlOabdY8uKB/4x6qhVMXN7GdhUuhBiHg4FZT616wGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMeMYeW5CXQ4N8FpLqQKzifOcgwrrk1OjbZZplx8XqEHvTsfYBOLdTaEUy7RuUmd6WAHoml7RPoGzMJ9am5JQ+WJSd5kdDg9KGrvcDT/TjMJJr19UIX9b8eoIOyCYUUq9BOPjAwHM7ORH36ePr8SJ1qtPL5IpAJifFG9gWe5QGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSrIYaNW; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSrIYaNW"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38759bcd877so2171688a91.2
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 17:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788048343; x=1788653143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=74+MFDCnnMnX6+RyDjQR2/C37pOAkmvUU1iToovvHzM=;
        b=TSrIYaNW/VNnYUULq7Sd/sWs6huJzd9/OMBiiCFcMgexGH1F+3UjEsLxCRGvcTA+xh
         f1X2Fx8yVJ1Fla6FHw0fijkOCh6rds1TNWGFbhhyPfe+QftPsD/l1HFukgmSk5Ix1paH
         fLQHRBa3+l3w7K7HSDgcGYwDRPkrvKXx/pJMO5DzAOA0ZDi6olGFcp+q2RChPdJXnoOl
         aVRg/G/rowhsakrNMOmmZtaTIlfLzx6L5fynaDSKHPV6V1OdDLIYSeFZotFFBB5gBf5+
         646kQCNNef+vvL1OAEUPWMjZcqsglAdP23CAyuAp/rmLrUAu4xCRKA668qi9eMCIzqzj
         Ou3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788048343; x=1788653143;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74+MFDCnnMnX6+RyDjQR2/C37pOAkmvUU1iToovvHzM=;
        b=nJtjqkCXlU7kxx61Fa6E3oCHIoIWQdhrEbrmYgGe2JbTnJHo1HrbgIO1aRHuh/IUf1
         wi7DQtVddRJblgMmlKFrVfU4owLYDTFT7GO/u/wqM9aC7rwIY3ckOTJEn3G3xemVXB3K
         efWXA2mIu2M+N/s1ZVnBHJspSn6kVyOr5+ra9/hJmKiI080Iqwz7TWGG+dyO2kQEwPGr
         yHlXSrKzI07qv0YExvg2Zz6zdI0bV2+/g3jnW0uW06VKGCHGZtAX2BbR8U+I7vmJPbdi
         bf8OY8y1gNEZgFKL4i5WrW8Rq1l/Z8ozosIbro3p3+4qJIaZi6Cxv5TvJvBeMJ4Qn1rq
         UlwA==
X-Forwarded-Encrypted: i=1; AKwUvByKhiISM3gJdm5tt6avTSyWv3dtFgU9Y/iCgTbIB5HlgA4FEkJzZUsPgXQioKwWBYkBy78/7MGc5Rkwbg==@vger.kernel.org
X-Gm-Message-State: AFuF++khEnjQz4bzEzwfzZWMbmGio1eDnyZhvyR7IbY+KDDjk3u1/Eum
	wn1J/eRfQkGjhci1gqBOz49XYQg3WAoPoTy6IXAkFXIwuxiDbsYHQGYN
X-Gm-Gg: AYBFou22sDUgfcADtkNNXvv/TZnlsXaj7Lk2ifPw6+SI0cQgifbiU1rBZuQYf7Paff2
	slaihbN74c3KBHgCTGGdsFp3ssqhl0WeZKDMp4juYnkn4YMj6NVkJQtEoGIHXcYrZPdHIqH5ATZ
	3FDgYg1hd+Hno8+G3ZO9E6wiA7Dg9/a5keaOoQNQQSuKKEcUOIUUIAvXO7hKaHQFctvKSmZIzci
	nDMDmuUN0/5/PbY3J8Y/BZZIl2IgS/Dr2YGujqumOQ1hR+570hTz++tnuEZruVPxzqAgRJVBnTB
	iEjWXQKHO+wnU902n+9R2/Tw64T69n5T9WP/D8aZICy4B/IHSZ60dZJeWfzQSUDh1g7MWJKdc8k
	58FQRO3v5crDoQdevW2rr2ZQTmVe57a4Mm/VgoSkUqwlmW8Zr8PD2n7D/ohb/uQb78zg29VKmNe
	iHqOFzaVPHOyvW2if398qO1wBRh1VCDMKk4uL9SPybmT/EgVJXFo6iLwXu6xpgUsBYztK+X3oHC
	w==
X-Received: by 2002:a17:90b:574b:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-396d10178d6mr30568280a91.14.1788048342632;
        Sat, 29 Aug 2026 17:05:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda368e6sm8678734a91.4.2026.08.29.17.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 17:05:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 29 Aug 2026 17:05:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (lm90) Reject channel 2 on chips with only
 one remote sensor
Message-ID: <ea37ba3f-004f-4544-ada7-06e712160cf8@roeck-us.net>
References: <20260826184750.4798-1-flaviu.nistor@gmail.com>
 <20260826184750.4798-3-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826184750.4798-3-flaviu.nistor@gmail.com>

On Wed, Aug 26, 2026 at 09:47:49PM +0300, Flaviu Nistor wrote:
> Validate firmware channel definitions against chip capabilities and return
> -EINVAL when channel 2 is configured on devices with 1 remote channel.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Applied.

Thanks,
Guenter
