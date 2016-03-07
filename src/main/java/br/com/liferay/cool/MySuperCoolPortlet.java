/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * The contents of this file are subject to the terms of the Liferay Enterprise
 * Subscription License ("License"). You may not use this file except in
 * compliance with the License. You can obtain a copy of the License by
 * contacting Liferay, Inc. See the License for the specific language governing
 * permissions and limitations under the License, including but not limited to
 * distribution rights of the Software.
 *
 *
 *
 */

package br.com.liferay.cool;

import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortletExtended;
import com.liferay.portal.kernel.util.StringPool;

import java.io.IOException;
import java.io.PrintWriter;

import javax.portlet.PortletException;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

/**
 * @author Andre Fabbro
 *
 */
public class MySuperCoolPortlet extends MVCPortletExtended {

	public void sayMyName(ResourceRequest resourceRequest,
			ResourceResponse resourceResponse) throws IOException,
			PortletException {

		String name = resourceRequest.getParameter("name");
		String feedbackMsg = StringPool.BLANK.equals(name) ? "No data received"
				: "Name Received Successfully";

		JSONObject jsonobj = JSONFactoryUtil.createJSONObject();
		jsonobj.put("dataReceivedMessage", feedbackMsg);
		jsonobj.put("MyName", name);

		PrintWriter printout = resourceResponse.getWriter();
		printout.print(jsonobj.toString());
	}

	public void sayMyEmail(ResourceRequest resourceRequest,
			ResourceResponse resourceResponse) throws IOException,
			PortletException {

		String email = resourceRequest.getParameter("email");
		String feedbackMsg = StringPool.BLANK.equals(email) ? "No data received"
				: "Email Received Successfully";

		JSONObject jsonobj = JSONFactoryUtil.createJSONObject();
		jsonobj.put("dataReceivedMessage", feedbackMsg);
		jsonobj.put("MyEmail", email);

		PrintWriter printout = resourceResponse.getWriter();
		printout.print(jsonobj.toString());
	}

}
