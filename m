Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974071;
	b=jTLdt2MInQgrxpHS4+j5EIHQnwb9l60g9Vx9gVsmzwrBaTCPn4zSO/GxdWaTRJ/OE+AC
	 /W5Kvuuh91Z2BVT52gnqqo63kSF0adgneQo6Ln9zFHo0GnpqUPm0NESVm/W/9MAJoGHh3
	 sJNl5R9q5XeJTr8NsIXKlvCLvKISdrl9E6iRs4Qi5JXIOaHv4vAPmCdcx6cqEOujuyjC3
	 /TE1QlMSIOsgRodvTx0nlsFULrNJVb2aWaO+CEqaUmrjexoTY0wScvItDmWIYZDKO04OP
	 XEMAgbyYPsPlRdOmG8hmJgPwglQ0DEP8MsXmNFOU1IRUIMhFpIPUkrS1YdqUejnLu4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=E5UQIZrsUjY0M8HBvkzofYrI4Utc73LHtISdy+Zvk0s=;
	b=Ii3PlhJEbuBWeEEf0olBTZ7J4DYi5anvMghJGNAsVKSjkpd1ZcA9SHDyeL49TDVNKPeC
	 H0iMQ+qMMFbxqICsLpBIjLmGduHPwPEVS1zQOxD0EwAoL6CspUTEpJZYehm3cZDDYW5Fx
	 f5tCY/SBwp1kVyzDvfQ2WdHKUS/AZTYJIA8RdLTxUStjvltdHXMHejY6h/LNqHFGuEZge
	 KVhvEpUmdVN3649HPZNlWhxR94ls5wxGj10Dx/eWv5k7qdOqfQDSF/D/bU+CD3SUdlc7P
	 0Wg8I//AQ+RkSVhhRzaWv5NadvE3L+7l+5M6MbPqxhdo/5MNfnaNvpYkDNSGV0MYRfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597DA606A31D
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 597DA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso1465676a91.2
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974071; x=1793578871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E5UQIZrsUjY0M8HBvkzofYrI4Utc73LHtISdy+Zvk0s=;
        b=lewLJdSSPjEPcv2HMEZBJkaENtQqv6hgCWl9ZeCBJhkMQbdq3AEyopJrdBPgiVhkMI
         iSS9VI99Pp5a9R8/9v+yHAwrDFxVhH1eDv51PboYzZT5D0JliUYuXWXdKqAqBlqE/IxJ
         6LPbDn5UbmPgQdPUzDwfgEl+q+FewgzwjypRp9zmJzzWW+i2+b4TamOKPWIXpqTQDZwH
         pO8bAS8ru47TViuC3fY2qZVTwTqyHtdzJFuiiN7oJUcdY1lUMVDJU9pNG9el+aqrbw1x
         7LBenTPDiHwnDZ1KbDUNAu/hzPPP2v146U7huSrULqS0OPt0aV5BwF0Vr9aVoVRHbT9n
         jpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974071; x=1793578871;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5UQIZrsUjY0M8HBvkzofYrI4Utc73LHtISdy+Zvk0s=;
        b=OeuR/5IGTsfffgoCK4iMqTFln9fc0eCBWHBwW9tCveeWX17h0JtKZNvf0dhm62YY37
         1RIus/kDf3g/F/eya1L94HXVLQbNkWTINzFdjGzzwT4GNlRbgQucvSWt08kdIpWr76WF
         VT2Ba23aaGcFEZRfEXNg8Wxz3O1/6aSP6bBgy9x8Gz5mBZbtbCR5l07q7d5vNAF7xDmT
         X40/rPhyFrRKnwuqlvOoV1SdXc3B8WmNQhUbIWMYIya0vmeGZv+ABTUcM6dSuUbqwA7Y
         Jic5ooLR16wdajS+3dD/m1KV0UXVkbSJw0GESg4+BXTkRis0nqOsryL25DRFxZdhYvuy
         b6pw==
X-Gm-Message-State: AFq9FYJ/tRXLwrkHJx8nJrTAs4SzULd2wrN8V+TDa3+egA46DAMETezd
	kkywxdDHxI3a76QQZZr3gqzi+oex+6jN4LPpqiWpNMntRSfGx2dksbDn
X-Gm-Gg: AYBFou31OmoZH75nCa0IowAxBUGiPTQeaehfF0UVlTJMYsSO7LSGp6bTl0dVuRPXCqn
	kv6wRDHJ4SM8btSHfrxCQwmVnwzCPOxo9pfYwAsa2gOkEp5KxS4LWK+N3pwFQmh5uoV/FYFiQK4
	WtK4WOPjgmtlSbI8TZ/FP3kr4BnzOhG+//T+M4dEQ8Hw9wlD5SElxsZxv6s84Nu7znR7NTY1F18
	h3XSTQ+R77HG4hcAPKDAT1+ERsNE4eWGT21o9WOfJ6IsLRrIdb5OGLuEvJrVhb2rX+nKTUt8dKm
	4/rJ4vNa/B5wZgaPgMhJZSWPa3eNtnc6dvBBPQ38MEoMXuJKzvWRw02EY4tLC6pLe8tJ7E3UhJb
	Z/osWy+zN7Ubn4hhntWwIhTkjP55+Wobg/o0uErTQ8gUW2uTSH4MLmEUOMdJRBrYdcz53CUUofO
	IfRkUaIR0vRLDWQMehtEK0HapCI7jr39H0jnQYMQSZVyE6mbQwNklnND/EofHjUOYPofkNZAZUy
	6UFDrOYmyfuaRAuBfNA35/GvyAzMcb4+iYNxOrBzc/8psmBRlNlz0FfGPVCVGI2wViIBnk=
X-Received: by 2002:a17:90b:3bc7:b0:3a4:ca46:8d44 with SMTP id 98e67ed59e1d1-3adead5841amr4344724a91.18.1792974070632;
        Sun, 25 Oct 2026 17:21:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebacc885sm6073592a91.5.2026.10.25.17.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:21:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:21:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: hsyemail2@gmail.com
Cc: linux-hwmon@vger.kernel.org, Sheng-Yuan Huang <syhuang3@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: lm75: Add Nuvoton NCT7715
Message-ID: <c7532675-6cec-4613-a3a7-4cda31bf16df@roeck-us.net>
References: <20260918084042.19541-1-syhuang3@nuvoton.com>
 <20260918084042.19541-2-syhuang3@nuvoton.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918084042.19541-2-syhuang3@nuvoton.com>

On Fri, Sep 18, 2026 at 04:40:40PM +0800, hsyemail2@gmail.com wrote:
> From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> 
> Add the Nuvoton NCT7715 compatible to the LM75 hwmon binding.
> 
> The NCT7715 supports an ALERT output, so permit the optional
> interrupts property for this compatible.
> 
> Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
