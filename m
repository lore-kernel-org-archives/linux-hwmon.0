Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E4327D76E
	for <linux-hwmon@vger.kernel.org>; Wed, 23 Apr 2025 14:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745418524; cv=none; b=drXGcaGyEU6DnE1S+aL0ClPpAZuiVWnD14suLVfrIeb2Vi6txxP3WNCb2ESwyJ9YUJ+JVHDYSrDjMsBgkRoXigBKHMpSfgtkERRCgsicZaQWsATME5HnqaEWYtApjqDVsv8bBTIZZVTiVb+JTWEDWNGECefav1WymuR5DS4vqyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745418524; c=relaxed/simple;
	bh=olgEi8hkKOP25EqBnRGPkbqDG4k0ZvkVsXbAyxVuiMs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QhKtC4elk4vMZ4E5a2FddtT1NTzPluJSCFiL+kilruT1yxO9JxXWay5AnMSlO3CWPNGpIsA+gkQ40tz3W6sjVP6HGjktwBke22B7DRJVdC9GjSOvgRBMQBasY7+UEcvSWWbhgKcsSxl+Sne8NIHkNetOo2LXH7GhDpsfzi3xuqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZbhweNAj; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZbhweNAj"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b0ae9e87fe2so801473a12.0
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Apr 2025 07:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745418521; x=1746023321; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=40rtvLOwDeuUbiOuCoW1t5olyX8gz8CZJ5ahJ10eU+w=;
        b=ZbhweNAj3oT2cEITBANR85a+3AC9Kt8YpgVC+0pS/UdzooqO2KwBAg8PnRDG2w+8V8
         qLox6rQ6BGUGoe3b/N5PTjmCpYwAoHz1scAtDySO/OO++U+IIv/fCY/b2WTSqa4ICql1
         WiIiDOMpIhKQ3+58D9U7phiYIB7CsXdaZox63CJKsMLu08KEtuOwmEvM+ddRmi5Pjhgh
         kSOrUE9BxdriaP9tjWEYTWIkAfttmZeIiL0RgKlYphs6LmDQ2TlevtGepgZwoacX5Tx8
         Egys+nSCqTDinlziB4MkKZqQgUmV+WE37wRkdZq4JtNRtANFxJucZbcim1uDIP9NEFhi
         FVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745418521; x=1746023321;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=40rtvLOwDeuUbiOuCoW1t5olyX8gz8CZJ5ahJ10eU+w=;
        b=okUkNPsMkpWbrmjEt3Dd7BQt+b7PsJTNqL5DOUv7VllfwNO/ErWK5xy6kJ5J9BmTsY
         5hQhQ0fyVabWJ7wPQewdfLmbYVFS2ikSl+9EToNzcC1c9tlC42B7zalt/4QN3qjozaGh
         z0QrBMy/dHMH6xlkXYvdCeFOHOMoBay97HgtiOmxYBqygN0J96m1I/7AF0i60Y3i0WXL
         RTdZjMGdNrzNt1ZSZehH+bRevSWjRsWjNSt2tzbleuOG5kS+lzjW7HdaIMDOYCm7Lh+g
         JESSao/NPivZETIi3KNqvKXxB1L4nuAh7VriZGMubR1g64RwAvLI31ZzGrQlsVllkVFX
         AzBA==
X-Forwarded-Encrypted: i=1; AJvYcCUnDgGjZuIPdxVA73Yn8F7BQPP/btsl/L6ZchfcVTyNR+6NXpmxeavl/cwKpqq7/TA0yyvkRtzgh3bONg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/4OD6dDP/ftlX+zjCuByHnE+N3orgG4jBe3nUJkTI+gKBHwW4
	AB4nw/WWH6LbLH0EsXGeAkQHZ3ByUO2QMJygDxkxy0gVJU5XZZ8C7PqKONnx4mqaaTBQL6XvRCQ
	r2g==
X-Google-Smtp-Source: AGHT+IEHFWhYz0oAsCQCzYVGgs17eJ2RdOv2pA+CJ/89PxdUza1pyAyGtkAfHJad1QU5DCSNGF6B8Gtgtdo=
X-Received: from pjxx4.prod.google.com ([2002:a17:90b:58c4:b0:301:1ea9:63b0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c2cd:b0:2fa:21d3:4332
 with SMTP id 98e67ed59e1d1-309df187b6dmr4574319a91.12.1745418521285; Wed, 23
 Apr 2025 07:28:41 -0700 (PDT)
Date: Wed, 23 Apr 2025 07:28:39 -0700
In-Reply-To: <20250422082216.1954310-4-xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422082216.1954310-1-xin@zytor.com> <20250422082216.1954310-4-xin@zytor.com>
Message-ID: <aAj5F9IZXG7MB0ai@google.com>
Subject: Re: [RFC PATCH v2 03/34] x86/msr: Rename rdpmcl() to rdpmcq()
From: Sean Christopherson <seanjc@google.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-edac@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	netdev@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, acme@kernel.org, 
	jgross@suse.com, andrew.cooper3@citrix.com, peterz@infradead.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, wei.liu@kernel.org, ajay.kaher@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com, 
	pbonzini@redhat.com, vkuznets@redhat.com, luto@kernel.org, 
	boris.ostrovsky@oracle.com, kys@microsoft.com, haiyangz@microsoft.com, 
	decui@microsoft.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 22, 2025, Xin Li (Intel) wrote:
> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> ---
>  arch/x86/events/amd/uncore.c              |  2 +-
>  arch/x86/events/core.c                    |  2 +-
>  arch/x86/events/intel/core.c              |  4 ++--
>  arch/x86/events/intel/ds.c                |  2 +-
>  arch/x86/include/asm/msr.h                |  2 +-
>  arch/x86/include/asm/paravirt.h           |  2 +-
>  arch/x86/kernel/cpu/resctrl/pseudo_lock.c | 12 ++++++------
>  7 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/x86/events/amd/uncore.c b/arch/x86/events/amd/uncore.c
> index f231e1078e51..b9933ab3116c 100644
> --- a/arch/x86/events/amd/uncore.c
> +++ b/arch/x86/events/amd/uncore.c
> @@ -152,7 +152,7 @@ static void amd_uncore_read(struct perf_event *event)
>  	if (hwc->event_base_rdpmc < 0)
>  		rdmsrq(hwc->event_base, new);
>  	else
> -		rdpmcl(hwc->event_base_rdpmc, new);
> +		rdpmcq(hwc->event_base_rdpmc, new);

Now that rdpmc() is gone, i.e. rdpmcl/rdpmcq() is the only helper, why not simply
rename rdpmcl() => rdpmc()?  I see no point in adding a 'q' qualifier; it doesn't
disambiguate anything and IMO is pure noise.
