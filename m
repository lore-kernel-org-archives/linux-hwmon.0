From: Thor Thayer <tthayer@opensource.altera.com>
To: linux-hwmon@vger.kernel.org
Date: Wed, 30 Mar 2016 07:27:36 -0700
Subject: Re: [RFC 7/8] hwmon: Altera Arria10 System Resource Chip - HW Monitor
In-Reply-To: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
Message-ID: <56FBE345.5030806@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>




On 03/29/2016 05:29 PM, Mark Brown wrote:

On Tue, Mar 29, 2016 at 04:43:41PM -0500, Thor Thayer wrote:


Yes, I see your point. In looking at the regulator drivers, I interpret
those as being controlled by the driver whereas this chip is passively
reporting status.


If the device isn't doing regulation it's not a regulator.


After reading the referenced document, I agree that hwmon probably isn't
appropriate. However, the regulator doesn't seem appropriate either (the
only status appears to be tied to battery properties).


We report status for regulators but that's tied to monitoring that's
built into a device that does regulation.

How about IIO or power supply?



Hi Mark,

Thanks for the clarification and for pointing out other frameworks to 
look at.


Yes, I think the iio may be a good place but I'll need to investigate 
where it should go. I'm not sure it fits into the adc subdirectory. I 
see similar functionality in the MAX1363 part but it's not actually an 
ADC - it only has the supervisor compare functionality.


Thank you!


--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
the body of a message to majord...@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
