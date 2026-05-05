Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E865D30ACE6
	for <linux-hwmon@vger.kernel.org>; Tue,  5 May 2026 23:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778022743; cv=none; b=NB2ITYahN9OdDVS/0Z4ZMAoTi/xxgwoy2MxrndMACzY1wJlbpoCbC7jRea15lp/R+Rp+H8rvKMoi2/uWzJ1hErHbfPUxzBaDEQfGjQ6BLpBirZtXlmwniSg+1DqhH5JcGB4VkWlOMwYoYtLYEO8FLtr7b1CXJsjuN0Xt2p5jiso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778022743; c=relaxed/simple;
	bh=/aBM8KLN5n124JvBcwRy2RW+8Ga8nqgEjNS2jK7iyc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SC52a5R9UBAOf9KwIZFvt/wb7jkwuIRqtKpgAYxC4dGjy9/YutxOjDvKpp36ioheuQ6TpZx8pb6tJC8xVU9+OXKt+cikZsawq4HqcFElAWXi63qBo0HoRceuNeTuxq8EfeuXopRyhOq3ISVY92xvnUdTIpwcNWQf6bGQKu2HhgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tHZjOL14; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tHZjOL14"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB5FC4AF09
	for <linux-hwmon@vger.kernel.org>; Tue,  5 May 2026 23:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778022742;
	bh=/aBM8KLN5n124JvBcwRy2RW+8Ga8nqgEjNS2jK7iyc0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tHZjOL148wsIaE8eiTrqH2IcxoZJfF1cw0mzYYXZbdI2FV/cJc24virD6J9LQoUDR
	 Fn4vJ4W54y0DDSf7bskUCukjDhfOHoEk2atUdaBkW0FifTqFtgby3FPI2mn9YbewFO
	 fla9PwzsfF1O/WbUUML58JjorPW5Ok+GcCiqZs/XwXgR67zX34byCK15caMz64lZ2u
	 98dZGUE3YOD0ONBJw3BmLoy4nHAlRLMQS8TrYXhSbN3dKTS8CsglOyta5YBhRFBvjH
	 FHRj8FpMbwo6Sg708Lybc4OAiMopL4fCSxlBx/Rf0wgybotwr7tMJZg01G/mvp77lg
	 JvOlj4wr02/UQ==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so9239234a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 05 May 2026 16:12:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/VjzMEUZO4gP5vGz7y7HS+xsHX/AQJCMypzgQJzjyICt1NRQbX0yXAJuzK/VI0jmdkvecLCGazlhrYmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaqnE2TIq+o0w45RjZhDTs8Kx3czPlDrQiroUbIuLvgn56fJrg
	oaHILRxLsR/j2M3eP9o3912BQoqMe8F79ErvE0UOsCaHDp02jNeY9Sd0951c9/Tp+Nj9/klJQgy
	X0nMiVKM2tS4pbkRCRSwIyVA5JA7uKg==
X-Received: by 2002:a05:6402:2cd:b0:66e:6ac4:2c01 with SMTP id
 4fb4d7f45d1cf-67d63d7f325mr205355a12.2.1778022741413; Tue, 05 May 2026
 16:12:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423085718.70762-2-akhilrajeev@nvidia.com>
 <20260423112311.E2902C2BCAF@smtp.kernel.org> <20260505213248.GA4000045-robh@kernel.org>
 <d357a7a0-920d-4ca6-82c0-c10a4a0a6db1@roeck-us.net>
In-Reply-To: <d357a7a0-920d-4ca6-82c0-c10a4a0a6db1@roeck-us.net>
From: Rob Herring <robh@kernel.org>
Date: Tue, 5 May 2026 18:12:10 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKuTog5TBxcbRNkmy30xCJ14z8tRAWFZ0e_acB98Tw6Tw@mail.gmail.com>
X-Gm-Features: AVHnY4KmuDCnmY5_0ne636IYyR4CARaKYdy7iQlWDeuCKQXIm7zmM4UwqS8Tfks
Message-ID: <CAL_JsqKuTog5TBxcbRNkmy30xCJ14z8tRAWFZ0e_acB98Tw6Tw@mail.gmail.com>
Subject: Re: [PATCH v3 01/13] dt-bindings: i3c: Add mipi-i3c-static-method to
 support SETAASA
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko@lists.linux.dev, Akhil R <akhilrajeev@nvidia.com>, 
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 5:17=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 5/5/26 14:32, Rob Herring wrote:
> > On Thu, Apr 23, 2026 at 11:23:11AM +0000, sashiko-bot@kernel.org wrote:
> >> Sashiko AI review found 3 potential issue(s):
> >
> > Does anyone read replies to the bot? If so, why was everyone hwmon list

everyone *but* the hwmon list...

> > dropped?
> >
>
> It appears that people either complain about getting AI feedback, or
> they complain that they don't. That is pretty much a lose-lose situation.
> For patches sent to linux-hwmon, Sashiko is configured to respond only
> to the mailing list and to the submitter in the hope to minimize the
> "I do not want to see this" feedback. That matches the configuration
> for several subsystems.
>
> As far as I can see it is not currently possible to limit AI review to
> patches actually associated with the given subsystem if sent to that
> subsystem's mailing list. I'll discuss with Roman to see if patches
> like this one can be filtered out when reviewing patches sent to
> hwmon mailing list.

No, I want the replies. I was just wondering why it is not reply-all
which is standard. I was also wondering why I was only sometimes
seeing the reviews. I have since figured that out and submitted a PR
to add DT. I set it to reply-all, so I guess there will be some
comment about that.

I don't think there's any solution if a patch hits 2 conflicting
configurations. Surely the folks that don't want to see it can figure
out how to delete or ignore emails... I have thousands of ignored
emails. It's not hard. :)

> >> - [Medium] The `mipi-i3c-static-method` schema incorrectly enforces `m=
inimum: 0x1`, preventing devices from declaring no static address assignmen=
t support.
> >> - [Low] The `assigned-address` property description is now inaccurate =
and contradicts the new capabilities.
> >> - [Low] Missing macro definition for Bit 2 ('Other CCC') in `include/d=
t-bindings/i3c/i3c.h`.
> >> --
> >
> > This should go below the quoted commit msg.
> >
>
> Others (like me) want to see it at the very top to see a quick summary.
> Another lose-lose situation.

If there's anything kernel developers agree on, it is not top posting.
I don't see how sashiko is special here. Isn't below the commit
message close enough to the top? I don't mind so much about the list
of issues being at the top, but I really don't see why the commit
message is not quoted (I would guess that's just an artifact of
creating the reply out of the git tree it was applied to?). The commit
hash is also completely useless to anyone without access to the git
tree sashiko uses.

One thing I would love to see is reviews of the commit message itself.
I would love to never have to say "don't use 'This commit/patch'" or
"the commit msg should answer why, not what" again.

Rob
