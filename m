Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC18469840
	for <linux-hwmon@vger.kernel.org>; Tue,  6 Oct 2026 14:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791297673; cv=pass; b=ByF/UxpmUtaBWo2MlMK1A253wqJ1zagXnlkVrnkAOmX5Gmg0Dbh4Px+J7OnPaHrAcVJtfwGPWJFtPYIZLPt7W/+ZgrzUMjf1DwDldm2psWFNwrNAYND/st3EXDtx7h3tpjjwVAPPCBC5BAIn+s5WIsV69d+NpbrD/6JB6T8tSbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791297673; c=relaxed/simple;
	bh=v/GsJDj9Q0Ij9HiaS1dDUSYj+explIch1r4r7AG4ZvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mm5vVaN8As8sfTmlXCG6trdwOvFBfvP9Mak0nr0AnUIZfbdC54Xm72UhHjhF86foxVV6L/n8c8O+8EM6ZfW4MIWF0AkoEliMwKLyKaBACBNiwf5r4STmB2gO48r9WgVw5BMuJkm2ub7o4Hl0qLUPO6csD0gGkSJvD1J/xxYDhTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+oxQupy; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+oxQupy"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1592210a91.2
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Oct 2026 07:41:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791297671; cv=none;
        d=google.com; s=arc-20260327;
        b=eAsNggSRlMintj6bh2mwUbJKGqxwiXWIjKexe99JLVTlPcyEWvEQ9S02dakTNW5FOa
         S1OpeDHh7I7hb3IpN23cPFZLgEgUJT838/KZ868MzUdJw1CmO+0Tbs7iMRnxyOvsWZ5+
         fM2lP3HadfONJh7i0qcv32NMAkV/v37JavfJGFRf1bQEL1ztFok6mxlk7FHqg80h6qog
         RE0p5VlQ08OPBqBudQJSHADVZh51FCkji1yoGvq2kOnoF4uBrL8BtNsuMsCOaZJumUwS
         Fz3em61PqifXND2rxwBUaMucx0WVIf5dyrAYoyfRPZt+1GvdUboaxnSkBLWYkalaqdbq
         lTsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v/GsJDj9Q0Ij9HiaS1dDUSYj+explIch1r4r7AG4ZvE=;
        fh=YMt5jgoRoz24eu59z6s8ZVD3n89BWzVhlbG9SkIncvE=;
        b=RgAB/13vybT83DQwV0crZTItVo9bsV5qBa7hxQRJvgesKn5pK5AleKMxr+CjrePTh3
         LOH1cyD1E2BjAHqECYDpvCu+jlWHU6cTGYoabFfg34Unlh8Y0uWGUMMPaq1fvLwcjNQH
         WkKyAhSn5n5d39cotqm648pOC3pxNRvgGzv+q3Xkxsy4SCRvJmfOui64rC1O/OAs/GIp
         cDLpaJ9xfZqO4sh3xBfimCi5uMZ8SIwt9WrDZRE/V66L8Ct7liTU5CkLS1muMjuSExIk
         sj43nkurZxm5tX63W23TprnO2WJUQSY9+aoPKPbbkB4cPC5IgU7zhTnx1a/O2vZUzTCt
         1HNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791297671; x=1791902471; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v/GsJDj9Q0Ij9HiaS1dDUSYj+explIch1r4r7AG4ZvE=;
        b=O+oxQupyIIBBhvKTa3w/s0bCMDMznrSh2OBwOFo8dFkoUsV/kpKGm6/K0iCPUKBLOt
         NJ4sF6/Ttjvc5dsJEN2JOkN93wvPN7hskF/EksdP+3AYNiCZAZ1eAAa6lk/ixWoWWCmO
         mr2uv/JVKJvzo/lG3KHJvGN3uyuWZ4Pocjd8R3lnocph0olqWab2U5gh1Zhub/MvY8sb
         4AdnbLF3XtiSSmNBQcQU6S8TNEoMdr0zk71BZu5yUjqK47ZaymFCT/Hks0B6evz5Z7WM
         Nf0A1A9Vxh8SXqvFCqM4AIQJmgiORqs3rG4rl5Ola1y7Buaa6w8Wr27z8VWtGg9+LNYU
         QvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791297671; x=1791902471;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v/GsJDj9Q0Ij9HiaS1dDUSYj+explIch1r4r7AG4ZvE=;
        b=Hkb0mM4D+alQvphNyykbRjyGEUB8kheTFD1dp8JGz9uDYiIVX9TVCGd37MN+m9sPNN
         +rSuCMJ+oDzVb+hgTC2kZL70/dNATIsA+E2Zs96VnTV8o0CXSwQ87EhyQwvZ+sAf+1+V
         FFdFJBMCRpOk1dslA/jJeRyz/iI8rIjh+9Imj+eoiiHVhyavYaEqzb8PN8D45UHGIXKo
         1j0brJ3RGn/SPqkUFWppJDOQRgiEKTWOaph1F8CAfNrJWyaXk9kNl10deGFGr5fLEzPO
         A/kbjDVNC7VuXaHnI5f+5rSuxFUV9ksiS1HaZfJIyOoL7nE03RBHIeiw+NHFIekrq94Q
         VS7g==
X-Forwarded-Encrypted: i=1; AKwUvBysHo4GAqK9o4uir+Z3dWeRCBg881VmLGryir3XSZUJNt0Izz0ETXh/ew6LDh4+0NTQhP/Nm6ZdMy2Whw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJDaIb97dIZWMuO0VEQVmsojfIL+uQQmo4c8qu2FLKPpxWaE32S
	iPxG+Gh5hp5WHx71MBhTO0WTg3z+O5tJPDYWhRXnvbvsZUS7iYaKZap7lPUJdX5FUBcs2Mj5WB0
	QhBL7yiS5d6udCKVoYGeUw3Ua8nCj1UA=
X-Gm-Gg: AYBFou0tIsvU179YUyl3mmYe3vA3e1Xy5xSC60o1tNxx6jgV8sp9e5FxLswVNptknlI
	gkcNHB62PdbcZSu/khADHt0KUQy34TBdCGMePEACesNJSbfBqOpvT0q05iQ2gMLemhdZvQp7Tfl
	By1dxm2wQ0hc2nf8lSoNdcox5qf1M4H+BBu9jn52j8CnsXm4m9mFdDuKthfADYmfV1N7+g6dWXX
	TlRlItHjQU4VWnYF2WpHFo2UJaZFZifvqXrpFmPcnb7SQmOMWHreKcfVlSKsZ4WoQLkhnItIODy
	xTqzX3oJOXDPBWHf/PYk29Hx0rRvniT8SgpBHZv2dntDjiqjq8/S36dL+/D7vMkrCJWnh9YCn/E
	kXb8vdZDP0Z5QJM93tKzv7qF8nAA3HA==
X-Received: by 2002:a17:90b:3949:b0:3a8:545a:9e87 with SMTP id
 98e67ed59e1d1-3a8545aa073mr2506773a91.15.1791297671442; Tue, 06 Oct 2026
 07:41:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-asus-ec-x570e-cpu-opt-v3-0-62672edc18b3@gmail.com> <20261006-asus-ec-x570e-cpu-opt-v3-1-62672edc18b3@gmail.com>
In-Reply-To: <20261006-asus-ec-x570e-cpu-opt-v3-1-62672edc18b3@gmail.com>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Tue, 6 Oct 2026 16:40:59 +0200
X-Gm-Features: AclHuK_VyES8DGlX4WpDsEtrXhRh82OdVQzj8EL621nkfmlGXF5ZyQLTHX8sgrw
Message-ID: <CAB95QAT4A8ONTYdQ9Y50t8zJZ3cOZr6ADSTknYdUUs1n80qciw@mail.gmail.com>
Subject: Re: [PATCH v3] hwmon: (asus-ec-sensors) add CPU_Opt fan for ROG STRIX
 X570-E GAMING
To: mdlayher@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Oct 2026 at 16:36, Matt Layher via B4 Relay
<devnull+mdlayher.gmail.com@kernel.org> wrote:
>
> From: Matt Layher <mdlayher@gmail.com>
>
> The board has a CPU_OPT fan header, which the EC reports at the same
> register (bank 0, 0xb0) as the other AMD 500 series boards. Enable it.
>
> Assisted-by: LLM sparse
> Signed-off-by: Matt Layher <mdlayher@gmail.com>

Reviewed-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Thank you,
Eugene
