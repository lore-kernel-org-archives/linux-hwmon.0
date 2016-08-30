Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:33324 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757715AbcH3QiG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 Aug 2016 12:38:06 -0400
Date: Tue, 30 Aug 2016 11:38:04 -0500
From: Rob Herring <robh@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux@roeck-us.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (max6650) Add initial rpm target devicetree
 documentation
Message-ID: <20160830163804.GA5954@rob-hp-laptop>
References: <1472026407-3448-1-git-send-email-mike.looijmans@topic.nl>
 <1472026407-3448-2-git-send-email-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1472026407-3448-2-git-send-email-mike.looijmans@topic.nl>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Aug 24, 2016 at 10:13:27AM +0200, Mike Looijmans wrote:
> Add devicetree property for early initialization of the fan controller
> to prevent overheating, for example when resetting the board while the
> fan was completely turned off.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>  Documentation/devicetree/bindings/hwmon/max6650.txt | 5 +++++
>  1 file changed, 5 insertions(+)

The kernel boot seems kind of late to ensure your fan is running, but

Acked-by: Rob Herring <robh@kernel.org>
