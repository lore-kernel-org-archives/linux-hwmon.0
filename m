Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:35378 "EHLO
	mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752449AbcHRT0B (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Thu, 18 Aug 2016 15:26:01 -0400
Date: Thu, 18 Aug 2016 14:11:02 -0500
From: Rob Herring <robh@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: devicetree@vger.kernel.org, hjk@hansjkoch.de, linux@roeck-us.net,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	mark.rutland@arm.com
Subject: Re: [PATCH] hwmon: (max6650.c) Add devicetree support documentation
Message-ID: <20160818191102.GA19498@rob-hp-laptop>
References: <1471332190-14638-1-git-send-email-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1471332190-14638-1-git-send-email-mike.looijmans@topic.nl>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Aug 16, 2016 at 09:23:10AM +0200, Mike Looijmans wrote:
> This adds the devicetree binding documentation for the max6650 fan
> controller.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> Associated code changes sent as a separate patch as requested.
> 
>  .../devicetree/bindings/hwmon/max6650.txt          | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/max6650.txt

Acked-by: Rob Herring <robh@kernel.org>
