Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2337F1624DF;
	Tue, 19 May 2026 15:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206037; cv=none; b=Zx/LFWBbmmNGsZoqAx4ecqL9WUhGKSNTFEYqbIPvw6Nz5XllQEqdo4FMjndf1vXYeeYkFocb6hZ1C5Z5GvU6qHM1FUyVvnyF8j8mR4GeTK6TGCebqeJE2F6KdeZHfYh/q5XTBpoOrIWBJwMIA2J/NUgiT/BWiVNrIDba1bnqG24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206037; c=relaxed/simple;
	bh=IW6oI+dP6+8t/EnbV2vOAq2rB/HmEGs+afYxKWinwSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kUl0j4Zb3YftnpSgYq9p1B1B+jw5+Q+HB4oMY/ZGONiuPXW0ruvI/NuDj/2+DiS2ITeCLhFzgRmyR63Ei6EIp6nzNue4aADM1jXThwX9vuASlRpnjs1jvTvfBX718RAk1rUK31kgn4HewCBU+bIKOiGgGmum441vVAal+56dqhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SO7bVaPD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SO7bVaPD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FA6C2BCB8;
	Tue, 19 May 2026 15:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779206036;
	bh=IW6oI+dP6+8t/EnbV2vOAq2rB/HmEGs+afYxKWinwSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SO7bVaPD6scZONFmP/xgShPwel0ta5jbjWELh5jmKekU9Mo0M3ql9ymG6zbH4GbL8
	 AZxH2BMDFZxxAYLHlnupcVqrapUqabXuoMiLQTG64OBRBP2Ylaq2ju6CzQQSk6srld
	 tElr4Kkilqrd/E3EyL4ZHWvgWCaVtFUXltYLQuMCtku53hLp2FOqXvDcLfdOpvyCem
	 6W1RJEZF6j/ZifxOj238rTx+x766n+uNwpRI0t6H4JwLS3O9HNxImAdTHfIvOrOaf+
	 J7S9obvNlMunGAqUEu5Zw0UfG7uEZyc1XBxjk/EDtTN6NK/X7yXd36IkrViotUDF9S
	 rL7zNg0WYdw3g==
Date: Tue, 19 May 2026 16:53:52 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Adam Young <admiyo@amperemail.onmicrosoft.com>
Cc: Adam Young <admiyo@os.amperecomputing.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Huisong Li <lihuisong@huawei.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] mailbox/pcc.c move shmem unmap to teardown
Message-ID: <20260519-conscious-beagle-of-virtuosity-3f5660@sudeepholla>
References: <20260515161001.699470-1-admiyo@os.amperecomputing.com>
 <20260519-annoying-athletic-mustang-cf3f02@sudeepholla>
 <05347a7f-ce9c-41da-a4ba-fbd27bd9f934@amperemail.onmicrosoft.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05347a7f-ce9c-41da-a4ba-fbd27bd9f934@amperemail.onmicrosoft.com>

On Tue, May 19, 2026 at 10:26:21AM -0400, Adam Young wrote:
> 
> On 5/19/26 08:18, Sudeep Holla wrote:
> > On Fri, May 15, 2026 at 12:10:01PM -0400, Adam Young wrote:
> > > If the mailbox IRQ and shmems are not cleaned up atomically there is a
> > > race condition. If the shmem is torn down while the IRQ is active, a late
> > > interrupt can trigger a write to un-mapped memory.
> > > If the shmem is torn down after the IRQ, and another thread requests the
> > > channel again, we can end up with a channel that has had its shmem
> > > unmapped.
> > > 
> > > By moving the unmap to the teardown process, we can let the mailbox
> > > mechanism prevent re-entrance into the startup/teardown functions.
> > > 
> > The startup-failure path now pass NULL to iounmap() in
> > pcc_mbox_request_channel().
> > 
> > __mbox_bind_client() calls mbox_free_channel() before returning an error when
> > ->startup() fails:
> > 
> > With this change, that mbox_free_channel() reaches pcc_shutdown() and clears
> > pcc_mchan->shmem.  Control then returns to pcc_mbox_request_channel(), which
> > still unconditionally calls iounmap(pcc_mchan->shmem) in the error path.
> > 
> > The startup and shutdown calls are symmetrical and similarly the
> > mbox_request and mbox_free. This change is removing that balance.
> > 
> > NACK from me.
> > 
> Yeah, I saw that (since posting) as well.
> 
> I have an updated version that moves the map to the startup and that removes
> the unmmap call from pcc_mbox_request_channel which seems to resolve the
> balancing issue. I will post shortly.
> 
> I was trying to minimize the change by not moving the map portion, but I
> realize that both need to be under control of the mbox code to get to a
> multithread safe design.
> 

But you fail to explain why after shutdown, a late interrupt arrives. I can't
follow that.

-- 
Regards,
Sudeep
