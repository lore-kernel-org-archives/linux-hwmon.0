Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B5B47F2E6;
	Fri,  5 Jun 2026 07:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780646122; cv=none; b=syblQpx2wWN/gxx1ZbJIh093XaiDObd23nYPHm7HLWG9PbXFnaL3sdIQHMCqqK/CeT1D3FB9CfENyyYEbf9IKQdgMe+x9MspKw6Ol5xF4cYXIQQxurBSS+T3zeE05FoHC2Ded5jfgXK8zBu2wCicQzglM4/L/jU0tSfpBr+q+jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780646122; c=relaxed/simple;
	bh=Emdj2NbzQAV88c/PCgYv2F//weGqzDG7T6rtjX9DTUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vqkd4v2eNkxawl57kGnxMcg1vB0SdTg2J4g2MqRqvE6KJN4+Kw+ZmIC94aG1R7UCO29POtvZJknp4sU947vBLQg+brlh+84sI2pVKnk7a9weFBdPrNBq1EUk2HXf1m5sor7LS3hBDv1adM5sg+TUlJMEFwYSirdgi7yF5v3zbU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Isn1we0g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Isn1we0g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928EF1F00893;
	Fri,  5 Jun 2026 07:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780646121;
	bh=SufUsgIiggL6e/QIsAbNMiTlzAF35c8U1qsO70/sUus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Isn1we0gRQ0IA56VJ975zayTIgZQq5Q/UX1+bWoFxBuH8QH8uUAvYT7WJHJxt0eeh
	 UmKSH62XntqctekH4GQbNsJ0cLWeZ1uP1Frds27G+a3hAp7j7wHBtrj6sf5hk+QktT
	 HvDNRxnDTy4bc6kbfrSXAUcAX6eTh5/5RHE9eYWbWtS00fPcJ4XvyWQFdZYmkbjxz7
	 GWi4xv+XiYvkO6Ub7+rvh2BRxDZeyO2ydUWM59QsMimuaGXDMvUonpLhMF6CS3Sgzh
	 sGst1S+VgDdfXYtCAwLW+VplkI6zq2QaVk4r4ijJQq8dxm8/5jFvULNUDDy8qxPszQ
	 fcFSWBqio6j9g==
Date: Fri, 5 Jun 2026 08:55:16 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Adam Young <admiyo@os.amperecomputing.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>, Len Brown <lenb@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-acpi@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Huisong Li <lihuisong@huawei.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v01] mailbox/pcc.c:  add query channel function
Message-ID: <20260605-undetectable-polecat-of-wonder-f817c0@sudeepholla>
References: <20260604203749.168752-1-admiyo@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604203749.168752-1-admiyo@os.amperecomputing.com>

On Thu, Jun 04, 2026 at 04:37:48PM -0400, Adam Young wrote:
> Drivers need information about a channel prior to creating a channel
> or they risk triggering message delivery on the remote side of a
> connection.
> 
> One of those pieces of infomration is the type of channel.
> 
> Add PCC channel type to records and expose PCC channel type to client.
> 

Please point me to the user of this interface.

-- 
Regards,
Sudeep
